//
//  ExampleCardImageViewController.swift
//  CardComponents
//
//  Created by Donald Ness on 2/22/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

class ExampleCardImageViewController: UIViewController {
    
    @IBOutlet var topCardImageView: UIImageView!
    @IBOutlet var centerCardImageView: UIImageView!
    @IBOutlet var bottomCardImageView: UIImageView!
    @IBOutlet var allCardImageView: UIImageView!
    
    var topCardImage: PartialCardImage {
        return PartialCardImage(drawMode: .top,
                                edgeInsets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
                                cornerRadius: 5,
                                shadowOffset: CGSize(width: 0, height: 0),
                                shadowOpacity: 1,
                                shadowRadius: 5)
    }
    
    var centerCardImage: PartialCardImage {
        return PartialCardImage(drawMode: .center,
                                edgeInsets: UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15),
                                cornerRadius: 5,
                                shadowOffset: CGSize(width: 0, height: 0),
                                shadowOpacity: 1,
                                shadowRadius: 5)
    }
    
    var bottomCardImage: PartialCardImage {
        return PartialCardImage(drawMode: .bottom,
                                edgeInsets: UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15),
                                cornerRadius: 5,
                                shadowOffset: CGSize(width: 0, height: 0),
                                shadowOpacity: 1,
                                shadowRadius: 5)
    }
    
    var allCardImage: PartialCardImage {
        return PartialCardImage(drawMode: .all,
                                edgeInsets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
                                cornerRadius: 5,
                                shadowOffset: CGSize(width: 0, height: 0),
                                shadowOpacity: 1,
                                shadowRadius: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCardImageView.image = topCardImage.draw()
        centerCardImageView.image = centerCardImage.draw()
        bottomCardImageView.image = bottomCardImage.draw()
        allCardImageView.image = allCardImage.draw()
    }
    
}
