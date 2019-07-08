//
//  ViewController.swift
//  iOSSample
//
//  Created by popota on 2019/07/08.
//  Copyright © 2019 Tagayasu. All rights reserved.
//

import UIKit
import GIFAnimationView

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.animationImage(name: "SampleGIF")
    }


}

