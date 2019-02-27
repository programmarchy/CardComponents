//
//  CardView.swift
//  CardComponents
//
//  Created by Donald Ness on 2/21/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    internal let shadowLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addShadowLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addShadowLayer()
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private func addShadowLayer() {
        shadowLayer.frame = bounds
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutShadowLayer()
        layoutCorners()
    }
    
    private func layoutShadowLayer() {
        shadowLayer.frame = bounds
        
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = Float(shadowOpacity)
        shadowLayer.shadowRadius = shadowRadius
        
        shadowLayer.fillColor = backgroundColor?.cgColor
    }
    
    internal var cornerMask: CACornerMask {
        return [ .layerMinXMinYCorner,
                 .layerMinXMaxYCorner,
                 .layerMaxXMinYCorner,
                 .layerMaxXMaxYCorner ]
    }
    
    internal var cornerPath: UIBezierPath {
        return UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    }
    
    internal func layoutCorners() {
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = cornerMask

        let cornerPath = self.cornerPath
        shadowLayer.path = cornerPath.cgPath
        shadowLayer.shadowPath = cornerPath.cgPath
    }
    
}
