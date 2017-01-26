//
//  EarthStackLayout.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 26/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

open class EarthStackLayout: StackLayout<UIView> {
    init(spacing: CGFloat, viewReuseId: String? = nil, text: String) {
        let earthImageLayout = SizeLayout<UIImageView>(size: CGSize(width: 50, height: 50), alignment: Alignment.bottomTrailing, flexibility: Flexibility.inflexible, viewReuseId: nil, sublayout: nil) { imageView in
            imageView.image = #imageLiteral(resourceName: "earth.png")
        }
        
        let earthInsetLayout = InsetLayout(insets: EdgeInsets(top: 30, left: 10, bottom: 0, right: 5), sublayout: earthImageLayout)
        
        let popCustmLayout = PopOverCustomLayout(text: text)
        let insetPoplayout = InsetLayout(insets: EdgeInsets(top: -5, left: 10, bottom: 10, right: 10), sublayout: popCustmLayout)
        
        super.init(axis: Axis.vertical,
                   spacing: spacing,
                   distribution: StackLayoutDistribution.fillFlexing,
                   alignment: Alignment.center,
                   flexibility: Flexibility.inflexible,
                   viewReuseId: viewReuseId,
                   sublayouts: [earthInsetLayout, insetPoplayout],
                   config: nil)
    }
}
