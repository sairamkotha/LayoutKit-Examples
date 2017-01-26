//
//  TopDividerStackLayout.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 25/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

open class DividerStackLayoutTopBottom<DividerView: View, V: View>: StackLayout<V> {
    
    public init(stack: StackLayout<V>, stackInsets: EdgeInsets,top: Bool, spacing: CGFloat = 0 ,dividerConfig: ((DividerView) -> Void)?) {
        let size = AxisSize(axis: Axis.vertical, axisLength: 0, crossLength: 0).size
        let divider = SizeLayout<DividerView>(size: size, alignment: .fill, flexibility: .flexible, config: dividerConfig)
        let dividerInsetLayout = InsetLayout(insets: EdgeInsets(top: 5, left: 0, bottom: 0, right: 0), sublayout: divider)
        let insetStackLayout = InsetLayout(insets: stackInsets, sublayout: stack)
        
        let subLayouts = top ? [dividerInsetLayout, insetStackLayout] : [insetStackLayout, dividerInsetLayout]
        super.init(axis: Axis.vertical,
                   spacing: spacing,
                   distribution: stack.distribution,
                   alignment: stack.alignment,
                   flexibility: stack.flexibility,
                   viewReuseId: nil,
                   sublayouts: subLayouts,
                   config: stack.config)
    }
    
}
