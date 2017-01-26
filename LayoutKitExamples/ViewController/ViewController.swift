//
//  ViewController.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 24/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    var combinedLayout: EarthStackLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        addEarthLayoutSample()
    }
}

/// Layouts
extension ViewController {
    fileprivate func addEarthLayoutSample() {
        combinedLayout = EarthStackLayout(spacing: 10, text: "Earth, otherwise known as the world, is the third planet from the Sun and the only object in the Universe known to harbor life")
        combinedLayout.arrangement(origin: CGPoint(x: 0, y: 50), width: self.view.frame.width).makeViews(in: self.view, direction: UserInterfaceLayoutDirection.leftToRight)
    }
}
