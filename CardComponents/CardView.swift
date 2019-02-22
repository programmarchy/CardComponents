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
    
    private var shadowLayer: CAShapeLayer?
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowFillColor: UIColor = .blue {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 2) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.65 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 2.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addShadowLayerIfNeeded()
        
        layoutShadowLayer()
    }
    
    private func addShadowLayerIfNeeded() {
        guard self.shadowLayer == nil else {
            return
        }
        
        let shadowLayer = CAShapeLayer()
        layer.insertSublayer(shadowLayer, at: 0)
        
        self.shadowLayer = shadowLayer
    }
    
    private func layoutShadowLayer() {
        guard let shadowLayer = shadowLayer else {
            return
        }
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        shadowLayer.path = shadowPath.cgPath
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = Float(shadowOpacity)
        shadowLayer.shadowRadius = shadowRadius
        
        shadowLayer.fillColor = backgroundColor?.cgColor
    }
    
}
