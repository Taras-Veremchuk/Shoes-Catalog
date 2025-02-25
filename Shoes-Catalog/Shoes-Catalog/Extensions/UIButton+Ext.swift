//
//  Button_Extension.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

extension UIButton {
    convenience init(title: String?, bgColor: UIColor) {
        self.init(type: .system)
        let height: CGFloat = 60
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        tintColor = .white
        heightAnchor.constraint(equalToConstant: height).isActive = true
        titleLabel?.font = .boldSystemFont(ofSize: 22)
    }
}
