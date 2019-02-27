//
//  ExampleCardViewController.swift
//  CardComponents
//
//  Created by Donald Ness on 2/21/19.
//  Copyright © 2019 Programmarchy, LLC. All rights reserved.
//

import UIKit

class ExampleCardViewController: UIViewController {

    @IBOutlet var cardView1: CardView!
    @IBOutlet var cardView1Label: UILabel!
    @IBOutlet var cardView1RadiusStepper: UIStepper!
    @IBOutlet var cardView1OffsetStepper: UIStepper!
    @IBOutlet var cardView1OpacitySlider: UISlider!
    
    @IBOutlet var cardView2: CardView!
    @IBOutlet var cardView2Label: UILabel!
    @IBOutlet var cardView2RadiusStepper: UIStepper!
    @IBOutlet var cardView2OffsetStepper: UIStepper!
    @IBOutlet var cardView2OpacitySlider: UISlider!
    
    @IBAction func cardView1RadiusStepperChanged() {
        cardView1.shadowRadius = CGFloat(cardView1RadiusStepper.value)
        updateCardView1LabelText()
    }
    
    @IBAction func cardView1OffsetStepperChanged() {
        cardView1.shadowOffset = CGSize(width: 0, height: CGFloat(cardView1OffsetStepper.value))
        updateCardView1LabelText()
    }
    
    @IBAction func cardView1OpacitySliderChanged() {
        cardView1.shadowOpacity = CGFloat(cardView1OpacitySlider.value)
        updateCardView1LabelText()
    }
    
    @IBAction func cardView2RadiusStepperChanged() {
        cardView2.shadowRadius = CGFloat(cardView2RadiusStepper.value)
        updateCardView2LabelText()
    }
    
    @IBAction func cardView2OffsetStepperChanged() {
        cardView2.shadowOffset = CGSize(width: 0, height: CGFloat(cardView2OffsetStepper.value))
        updateCardView2LabelText()
    }
    
    @IBAction func cardView2OpacitySliderChanged() {
        cardView2.shadowOpacity = CGFloat(cardView2OpacitySlider.value)
        updateCardView2LabelText()
    }
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private func formatCGFloat(_ value: CGFloat) -> String {
        return numberFormatter.string(from: NSNumber(value: Float(value)))!
    }
    
    private func formatCardViewLabel(radius: CGFloat, offset: CGFloat, opacity: CGFloat) -> String? {
        return String(format: "This is a card view with shadow radius %1$@, offset %2$@, and opacity %3$@.",
                      formatCGFloat(radius),
                      formatCGFloat(offset),
                      formatCGFloat(opacity))
    }
    
    private func updateCardView1LabelText() {
        cardView1Label.text = formatCardViewLabel(radius: cardView1.shadowRadius,
                                                  offset: cardView1.shadowOffset.height,
                                                  opacity: cardView1.shadowOpacity)
    }
    
    private func updateCardView2LabelText() {
        cardView2Label.text = formatCardViewLabel(radius: cardView2.shadowRadius,
                                                  offset: cardView2.shadowOffset.height,
                                                  opacity: cardView2.shadowOpacity)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCardView1LabelText()
        updateCardView2LabelText()
    }

}
