//
//  ViewController.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 24/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    var combinedLayout: StackLayout<View>!

    override func viewDidLoad() {
        super.viewDidLoad()

        addEarthLayoutSample()
    }
}

/// Layouts
extension ViewController {
    fileprivate func addEarthLayoutSample() {
        let earthImageLayout = SizeLayout<UIImageView>(size: CGSize(width: 50, height: 50), alignment: Alignment.bottomTrailing, flexibility: Flexibility.inflexible, viewReuseId: nil, sublayout: nil) { imageView in
            imageView.image = #imageLiteral(resourceName: "earth.png")
        }

        let earthInsetLayout = InsetLayout(insets: EdgeInsets(top: 30, left: 10, bottom: 0, right: 5), sublayout: earthImageLayout)

        let popCustmLayout = PopOverCustomLayout(text: "Earth, otherwise known as the world, is the third planet from the Sun and the only object in the Universe known to harbor life")
        let insetPoplayout = InsetLayout(insets: EdgeInsets(top: -5, left: 10, bottom: 10, right: 10), sublayout: popCustmLayout)

        combinedLayout = StackLayout(axis: Axis.vertical, spacing: 10, distribution: StackLayoutDistribution.fillFlexing, alignment: Alignment.center, flexibility: Flexibility.inflexible, viewReuseId: nil, sublayouts: [earthInsetLayout, insetPoplayout], config: nil)

        combinedLayout.arrangement(width: self.view.frame.width).makeViews(in: self.view, direction: UserInterfaceLayoutDirection.leftToRight)
    }
}
