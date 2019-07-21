//
//  UIImage+Extension.swift
//  GIFAnimationView
//
//  Created by popota on 2019/07/08.
//  Copyright © 2019 Tagayasu. All rights reserved.
//

import Foundation

extension UIImage {
    public static func gifData(name: String) -> Data? {
        guard let gifPath = Bundle.main.url(forResource: name, withExtension: "gif") else { return nil }
        return try? Data(contentsOf: gifPath)
    }
}

extension Data {
    public var animationImages: [UIImage]? {
        guard let cgImageSource = CGImageSourceCreateWithData(self as CFData, nil) else { return nil }
        let cgImageSourceCount = CGImageSourceGetCount(cgImageSource)
        return (0...cgImageSourceCount).compactMap { (index) -> UIImage? in
            guard let cgImage = CGImageSourceCreateImageAtIndex(cgImageSource, index, nil) else { return nil }
            return UIImage(cgImage: cgImage)
        }
    }
    
    public var animateDuration: Double {
        guard let cgImageSource = CGImageSourceCreateWithData(self as CFData, nil) else { return 0.0 }
        let cgImageSourceCount = CGImageSourceGetCount(cgImageSource)
        return (0...cgImageSourceCount).reduce(into: 0.0) { (result, index) in
            let prop = CGImageSourceCopyPropertiesAtIndex(cgImageSource, index, nil) as? [String: Any]
            let gif = prop?["{GIF}"] as? [String: Any]
            let delayTime = gif?["DelayTime"] as? Double ?? 0.0
            result += delayTime
        }
    }
}
