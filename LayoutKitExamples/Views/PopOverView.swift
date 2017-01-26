//
//  PopOverView.swift
//  LayoutKitExamples
//
//  Created by SaiRam on 25/01/17.
//  Copyright © 2017 Sairamkotha. All rights reserved.
//

import UIKit

open class SwPopoverView: UIView {
    var offset: CGFloat = 5
    var sizeArrow: CGFloat = 20
    let cornerRadius: CGFloat = 2
    let arrowSize = CGSize(width: 15, height: 7.5)
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = .white
        let width = frame.size.width
        let color = UIColor.lightGray.withAlphaComponent(0.3)
        let arrowPoint = CGPoint(x: width-sizeArrow*0.5 - offset, y: sizeArrow*0.5)
        let arrow = UIBezierPath()
        arrow.move(to: CGPoint(x: arrowPoint.x, y: 0))
        arrow.addLine(
            to: CGPoint(
                x: arrowPoint.x + arrowSize.width * 0.5,
                y: isCornerRightArrow() ? arrowSize.height + bounds.height : arrowSize.height
        ))
        
        arrow.addLine(to: CGPoint(x: bounds.width - cornerRadius, y: arrowSize.height))
        arrow.addArc(
            withCenter: CGPoint(
                x: bounds.width - cornerRadius,
                y: arrowSize.height + cornerRadius
            ),
            radius: cornerRadius,
            startAngle: radians(270.0),
            endAngle: radians(0),
            clockwise: true)
        
        arrow.addLine(to: CGPoint(x: bounds.width, y: bounds.height - cornerRadius))
        arrow.addArc(
            withCenter: CGPoint(
                x: bounds.width - cornerRadius,
                y: bounds.height - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: radians(0),
            endAngle: radians(90),
            clockwise: true)
        
        arrow.addLine(to: CGPoint(x: 0, y: bounds.height))
        arrow.addArc(
            withCenter: CGPoint(
                x: cornerRadius,
                y: bounds.height - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: radians(90),
            endAngle: radians(180),
            clockwise: true)
        
        arrow.addLine(to: CGPoint(x: 0, y: arrowSize.height + cornerRadius))
        arrow.addArc(
            withCenter: CGPoint(x: cornerRadius,
                                y: arrowSize.height + cornerRadius
            ),
            radius: cornerRadius,
            startAngle: radians(180),
            endAngle: radians(270),
            clockwise: true)
        
        arrow.addLine(to: CGPoint(x: arrowPoint.x - arrowSize.width * 0.5,
                                  y: isCornerLeftArrow() ? arrowSize.height + bounds.height : arrowSize.height))
        color.setFill()
        arrow.fill()
    }
    
    fileprivate func radians(_ degrees: CGFloat) -> CGFloat {
        return (CGFloat(M_PI) * degrees / 180)
    }
    
    fileprivate func isCornerLeftArrow() -> Bool {
        return frame.width - offset == frame.origin.x
    }
    
    fileprivate func isCornerRightArrow() -> Bool {
        return frame.width - offset == frame.origin.x + bounds.width
    }
}
