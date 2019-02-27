//
//  PartialCardView.swift
//  CardComponents
//
//  Created by Donald Ness on 2/21/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

enum PartialCardViewDrawMode: String {
    case all
    case top
    case center
    case bottom
}

extension PartialCardViewDrawMode {
    fileprivate static func fromIBInspectable(rawValue: String) -> PartialCardViewDrawMode {
        return PartialCardViewDrawMode(rawValue: rawValue) ?? .all
    }
    
    fileprivate func toIBInspectable() -> String {
        return rawValue
    }
}

@IBDesignable
class PartialCardView: CardView {
    
    var drawMode: PartialCardViewDrawMode = .all {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var drawModeRawValue: String {
        get {
            return drawMode.toIBInspectable()
        }
        set {
            drawMode = PartialCardViewDrawMode.fromIBInspectable(rawValue: newValue)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch drawMode {
        case .all:
            removeCropLayerMask()
        case .top:
            setTopCropLayerMask()
        case .center:
            setCenterCropLayerMask()
        case .bottom:
            setBottomCropLayerMask()
        }
    }
    
    override var cornerMask: CACornerMask {
        switch drawMode {
        case .all:
            return super.cornerMask
        case .top:
            return [ .layerMinXMaxYCorner,
                     .layerMaxXMaxYCorner ]
        case .center:
            return []
        case .bottom:
            return [ .layerMinXMinYCorner,
                     .layerMaxXMinYCorner ]
        }
    }
    
    override var cornerPath: UIBezierPath {
        switch drawMode {
        case .all:
            return super.cornerPath
        case .top:
            return UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [ .topLeft, .topRight ],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case .center:
            return UIBezierPath(rect: bounds)
        case .bottom:
            return UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [ .bottomLeft, .bottomRight ],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        }
    }
    
    private func setTopCropLayerMask() {
        let shadowHeight = shadowRadius + shadowOffset.height
        let cropRect = CGRect(x: -shadowRadius,
                              y: -shadowHeight,
                              width: bounds.width + 2 * shadowRadius,
                              height: bounds.height + shadowHeight)
        
        let cropMask = CAShapeLayer()
        cropMask.path = UIBezierPath(rect: cropRect).cgPath
        shadowLayer.mask = cropMask
    }
    
    private func setCenterCropLayerMask() {
        let cropRect = CGRect(x: -shadowRadius,
                              y: 0,
                              width: bounds.width + 2 * shadowRadius,
                              height: bounds.height)
        
        let cropMask = CAShapeLayer()
        cropMask.path = UIBezierPath(rect: cropRect).cgPath
        shadowLayer.mask = cropMask
    }
    
    private func setBottomCropLayerMask() {
        let shadowHeight = shadowRadius + shadowOffset.height
        let cropRect = CGRect(x: -shadowRadius,
                              y: 0,
                              width: bounds.width + 2 * shadowRadius,
                              height: bounds.height + shadowHeight)
        
        let cropMask = CAShapeLayer()
        cropMask.path = UIBezierPath(rect: cropRect).cgPath
        shadowLayer.mask = cropMask
    }
    
    private func removeCropLayerMask() {
        shadowLayer.mask = nil
    }
    
}
