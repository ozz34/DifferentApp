//
//  GradientView.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 15.08.2022.
//

import UIKit

class GradientView: UIView {
    // MARK: - Private properties
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Lyfecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    // MARK: - Override functions
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
    }
    // MARK: - Private functions
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
    }
    
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
