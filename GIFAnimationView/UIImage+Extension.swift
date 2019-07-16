//
//  UIImage+Extension.swift
//  GIFAnimationView
//
//  Created by popota on 2019/07/08.
//  Copyright © 2019 Tagayasu. All rights reserved.
//

import Foundation

extension UIImage {
    public static func animationImages(name: String) -> [UIImage]? {
        guard let imageData = imageData(name: name),
        let cgImageSource = CGImageSourceCreateWithData(imageData as CFData, nil) else { return nil }
        let cgImageSourceCount = CGImageSourceGetCount(cgImageSource)
        return (0...cgImageSourceCount).compactMap { (index) -> UIImage? in
            guard let cgImage = CGImageSourceCreateImageAtIndex(cgImageSource, index, nil) else { return nil }
            return UIImage(cgImage: cgImage)
        }
    }
}

private extension UIImage {
    static func imageData(name: String) -> Data? {
        guard let gifPath = Bundle.main.url(forResource: name, withExtension: "gif") else { return nil }
        return try? Data(contentsOf: gifPath)
    }
}
