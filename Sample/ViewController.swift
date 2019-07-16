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
        setupObservers()
    }

    @IBAction func animationPlayButtonDidTapped(_ sender: UIButton) {
        if imageView.isAnimating {
            imageView.stopAnimating()
        } else {
            imageView.startAnimating()
        }
    }
}

private extension ViewController {
    func setupSubViews() {
        imageView.animationImages = UIImage.animationImages(name: "sampleGIF")
        imageView.animationRepeatCount = 0
        animationPlayButton.setTitle("Animation Start", for: .normal)
    }
    
    func setupObservers() {
        observers.append(contentsOf: [
            imageView.observe(\.isAnimating) {[weak self] (imageView, value) in
                if value.newValue ?? false {
                    self?.animationPlayButton.setTitle("Animation Stop", for: .normal)
                } else {
                    self?.animationPlayButton.setTitle("Animation Start", for: .normal)
                }
            }
            ])
    }
}

