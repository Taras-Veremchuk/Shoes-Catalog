//
//  Stack_Extension.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, aligment: Alignment, bgColor: UIColor? = nil, radius: CGFloat = 0) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = aligment
        self.backgroundColor = bgColor
        self.layer.cornerRadius = radius
    }
}
