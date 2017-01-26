//
//  ViewController.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 24/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let earthImageLayout = SizeLayout<UIImageView>(size: CGSize(width: 50, height: 50), alignment: Alignment.bottomTrailing, flexibility: Flexibility.inflexible, viewReuseId: nil, sublayout: nil) { (imageView) in
            imageView.image = #imageLiteral(resourceName: "earth.png")
        }
        
        let earthInsetLayout = InsetLayout(insets: EdgeInsets(top: 30, left: 10, bottom: 0, right: 5), sublayout: earthImageLayout)
        
        let popCustmLayout = PopOverCustomLayout()
        let insetPoplayout = InsetLayout(insets: EdgeInsets(top: -5, left: 10, bottom: 10, right: 10), sublayout: popCustmLayout)
        
        let combinedLayout = StackLayout(axis: Axis.vertical, spacing: 10, distribution: StackLayoutDistribution.fillFlexing, alignment: Alignment.center, flexibility: Flexibility.inflexible, viewReuseId: nil, sublayouts: [earthInsetLayout, insetPoplayout], config: nil)
        
        combinedLayout.arrangement(width: self.view.frame.width).makeViews(in: self.view, direction: UserInterfaceLayoutDirection.leftToRight)
    }

}

