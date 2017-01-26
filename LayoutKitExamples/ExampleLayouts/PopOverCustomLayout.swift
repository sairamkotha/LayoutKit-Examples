//
//  PopOverCustomLayout.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 25/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

class PopOverCustomLayout: StackLayout<SwPopoverView> {
    
    init() {
        
        let labelLayout = LabelLayout<UILabel>(text: "Earth, otherwise known as the world, is the third planet from the Sun and the only object in the Universe known to harbor life", font: UIFont.systemFont(ofSize: 12), numberOfLines: 0, alignment: Alignment.center, flexibility: Flexibility.inflexible, viewReuseId: "daskda", config: nil)
                
        let insetPopoverLayout = InsetLayout(insets: EdgeInsets(top: 20, left: 10, bottom: 10, right: 8), sublayout: labelLayout)
        
        super.init(
            axis: .horizontal,
            spacing: 0,
            distribution: .leading,
            alignment: Alignment.center,
            flexibility: .inflexible,
            viewReuseId: nil,
            sublayouts: [insetPopoverLayout],
            config: { (view) in
                view.backgroundColor = .white
        }
        )
    }
    
    open override var needsView: Bool {
        return super.needsView
    }
}
