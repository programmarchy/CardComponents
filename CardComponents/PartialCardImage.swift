//
//  PartialCardImage.swift
//  CardComponents
//
//  Created by Donald Ness on 2/21/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

enum PartialCardImageDrawMode: String {
    case all
    case top
    case center
    case bottom
}

struct PartialCardImage {
    
    var drawMode: PartialCardImageDrawMode
    var edgeInsets: UIEdgeInsets
    var backgroundColor: UIColor
    var cornerRadius: CGFloat
    var shadowColor: UIColor
    var shadowOffset: CGSize
    var shadowOpacity: CGFloat
    var shadowRadius: CGFloat
    
    init(drawMode: PartialCardImageDrawMode = .all,
         edgeInsets: UIEdgeInsets = .zero,
         backgroundColor: UIColor = .white,
         cornerRadius: CGFloat = 0.0,
         shadowColor: UIColor = .black,
         shadowOffset: CGSize = CGSize(width: 0, height: 0),
         shadowOpacity: CGFloat = 0.0,
         shadowRadius: CGFloat = 0.0) {
        self.drawMode = drawMode
        self.edgeInsets = edgeInsets
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
    }
    
    private var shadowInsets: UIEdgeInsets {
        var insets = self.edgeInsets
        
        switch drawMode {
        case .top:
            insets.bottom = 0
        case .center:
            insets.top = 0
            insets.bottom = 0
        case .bottom:
            insets.top = 0
        default:
            break
        }
        
        return insets
    }
    
    private var imageSize: CGSize {
        let width = shadowInsets.left + shadowWidth + 1 + shadowWidth + shadowInsets.right
        let shadowTop = shadowInsets.top + shadowHeight
        let shadowBottom = shadowInsets.bottom + shadowHeight
        
        switch drawMode {
        case .top:
            return CGSize(width: width,
                          height: 1 + shadowTop)
        case .center:
            return CGSize(width: width,
                          height: 1)
        case .bottom:
            return CGSize(width: width,
                          height: 1 + shadowBottom)
        default:
            return CGSize(width: width,
                          height: 1 + shadowTop + shadowBottom)
        }
    }
    
    private var shadowRect: CGRect {
        let x = shadowInsets.left
        let width = shadowWidth + 1 + shadowWidth
        let height = shadowHeight + 1 + shadowHeight

        switch drawMode {
        case .top:
            return CGRect(x: x,
                          y: shadowInsets.top,
                          width: width,
                          height: height)
        case .center:
            return CGRect(x: x,
                          y: -shadowHeight,
                          width: width,
                          height: height)
        case .bottom:
            return CGRect(x: x,
                          y: height - shadowInsets.bottom,
                          width: width,
                          height: height)
        default:
            return CGRect(x: x,
                          y: shadowInsets.top,
                          width: width,
                          height: height)
        }
    }
    
    private var resizableImageCapInsets: UIEdgeInsets {
        var insets = UIEdgeInsets(top: shadowInsets.top + shadowHeight,
                                  left: shadowInsets.left + shadowWidth,
                                  bottom: shadowInsets.bottom + shadowHeight,
                                  right: shadowInsets.right + shadowWidth)
        
        switch drawMode {
        case .top:
            insets.bottom = 1
        case .center:
            insets.top = 1
            insets.bottom = 1
        case .bottom:
            insets.top = 1
        default:
            break
        }
        
        return insets
    }
    
    func draw() -> UIImage? {
        let size = imageSize
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        let shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: cornerRadius)
        
        context.setShadow(offset: shadowOffset,
                          blur: shadowRadius,
                          color: shadowColor.withAlphaComponent(shadowOpacity).cgColor)
        
        context.setFillColor(backgroundColor.cgColor)
        
        shadowPath.fill()
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        
        return image.resizableImage(withCapInsets: resizableImageCapInsets,
                                    resizingMode: .stretch)
    }

    private var shadowHeight: CGFloat {
        return shadowRadius + shadowOffset.height
    }
    
    private var shadowWidth: CGFloat {
        return shadowRadius + shadowOffset.width
    }

}
