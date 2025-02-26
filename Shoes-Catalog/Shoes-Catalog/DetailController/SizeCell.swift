//
//  SizeCell.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class SizeCell: UICollectionViewCell {
    static let reusedID = "SizeCell"
    let sizeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sizeLabel)

        NSLayoutConstraint.activate([
            sizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            sizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
