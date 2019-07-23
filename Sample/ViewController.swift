//
//  ViewController.swift
//  Sample
//
//  Created by popota on 2019/07/08.
//  Copyright © 2019 Tagayasu. All rights reserved.
//

import UIKit
import GIFAnimationView

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet weak var animationPlayButton: UIButton!
    
    // MARK: Property
    private var observers: [NSKeyValueObservation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    @IBAction func animationPlayButtonDidTapped(_ sender: UIButton) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            animationPlayButton.setTitle("Animation Start", for: .normal)
        } else {
            imageView.startAnimating()
            animationPlayButton.setTitle("Animation Stop", for: .normal)
            if animationDuration() > 0.0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration()) { [unowned self] in
                    self.animationPlayButton.setTitle("Animation Start", for: .normal)
                }
            }
        }
    }
}

private extension ViewController {
    func setupSubViews() {
        let gifData = UIImage.gifData(name: "sampleGIF")
        imageView.image = gifData?.animationImages?.first
        imageView.animationImages = gifData?.animationImages
        imageView.animationRepeatCount = 0
        imageView.animationDuration = gifData?.animateDuration ?? 0.0
        animationPlayButton.setTitle("Animation Start", for: .normal)
    }
    
    func animationDuration() -> Double {
        return imageView.animationDuration * Double(imageView.animationRepeatCount)
    }
}

