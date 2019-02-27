//
//  CardTableViewController.swift
//  CardComponents
//
//  Created by Donald Ness on 2/21/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

class CardBackgroundImageView: UIView {
    
    let cardImage: PartialCardImage
    
    let imageView = UIImageView()

    init(cardImage: PartialCardImage) {
        self.cardImage = cardImage
        
        super.init(frame: .zero)
        
        imageView.image = cardImage.draw()
        
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var edgeInsets = UIEdgeInsets.zero
        
        switch cardImage.drawMode {
        case .top:
            edgeInsets.top = -cardImage.edgeInsets.top
        case .bottom:
            edgeInsets.bottom = -cardImage.edgeInsets.bottom
        case .all:
            edgeInsets.top = -cardImage.edgeInsets.top
            edgeInsets.bottom = -cardImage.edgeInsets.bottom
        default:
            break
        }
        
        imageView.frame = bounds.inset(by: edgeInsets)
        
        clipsToBounds = false
    }
    
}

class CardTableViewController: UITableViewController {
    
    let cellBackgroundColor = UIColor.white
    let cellSelectedBackgroundColor = UIColor.lightGray
    let edgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    let cornerRadius: CGFloat = 5.0
    let shadowOpacity: CGFloat = 0.65
    let shadowRadius: CGFloat = 5.0
    
    private func cardImage(drawMode: PartialCardImageDrawMode, backgroundColor: UIColor) -> PartialCardImage {
        return PartialCardImage(drawMode: drawMode,
                                edgeInsets: edgeInsets,
                                backgroundColor: backgroundColor,
                                cornerRadius: cornerRadius,
                                shadowOpacity: shadowOpacity,
                                shadowRadius: shadowRadius)
    }

    func allCardBackgroundView(backgroundColor: UIColor) -> UIView? {
        return CardBackgroundImageView(cardImage: cardImage(drawMode: .all, backgroundColor: backgroundColor))
    }
    
    func topCardBackgroundView(backgroundColor: UIColor) -> UIView? {
        return CardBackgroundImageView(cardImage: cardImage(drawMode: .top, backgroundColor: backgroundColor))
    }
    
    func centerCardBackgroundView(backgroundColor: UIColor) -> UIView? {
        return CardBackgroundImageView(cardImage: cardImage(drawMode: .center, backgroundColor: backgroundColor))
    }
    
    func bottomCardBackgroundView(backgroundColor: UIColor) -> UIView? {
        return CardBackgroundImageView(cardImage: cardImage(drawMode: .bottom, backgroundColor: backgroundColor))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: edgeInsets.left * 2, bottom: 0, right: edgeInsets.right * 2)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        
        cell.backgroundColor = .clear
        cell.clipsToBounds = false
        
        if numberOfRows <= 1 {
            cell.backgroundView = allCardBackgroundView(backgroundColor: cellBackgroundColor)
            cell.selectedBackgroundView = allCardBackgroundView(backgroundColor: cellSelectedBackgroundColor)
            return
        }
        
        if indexPath.row == 0 {
            cell.backgroundView = topCardBackgroundView(backgroundColor: cellBackgroundColor)
            cell.selectedBackgroundView = topCardBackgroundView(backgroundColor: cellSelectedBackgroundColor)
        } else if indexPath.row + 1 < numberOfRows {
            cell.backgroundView = centerCardBackgroundView(backgroundColor: cellBackgroundColor)
            cell.selectedBackgroundView = centerCardBackgroundView(backgroundColor: cellSelectedBackgroundColor)
        } else if indexPath.row + 1 == numberOfRows {
            cell.backgroundView = bottomCardBackgroundView(backgroundColor: cellBackgroundColor)
            cell.selectedBackgroundView = bottomCardBackgroundView(backgroundColor: cellSelectedBackgroundColor)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    
}
