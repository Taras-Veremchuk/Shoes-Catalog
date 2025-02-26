//
//  Label_Extension.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

extension UILabel {
    convenience init(title: String = "", textColor: UIColor = .black, fontSize: CGFloat, lines: Int = 0, isBold: Bool = false) {
        self.init()
        self.text = title
        self.textColor = textColor
        self.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        self.numberOfLines = lines
    }
}
