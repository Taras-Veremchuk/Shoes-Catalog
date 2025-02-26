//
//  BigShoesCell.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class BigShoesCell: UICollectionViewCell {
    static let reusedID = "BigShoesCell"

    let shoesImageView = UIImageView(
        customImage: .adidas, contentMode: .scaleAspectFill, cornerRadius: 20)
    let titleLabel = UILabel(textColor: .white, fontSize: 28)
    let priceLabel = UILabel(textColor: .white, fontSize: 48, isBold: true)
    let sizesLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }

    func setupCell(shoe: Shoes) {
        priceLabel.text = "\(shoe.price)zł"
        titleLabel.text = shoe.title
        shoesImageView.image = UIImage(named: shoe.imgTitle)
        let sizesText = textOfLabel(shoe.size)
        sizesLabel.text = sizesText
        sizesLabel.widthAnchor.constraint(
            equalToConstant: widthOfLabel(sizesText)
        ).isActive = true
    }

    private func textOfLabel(_ sizes: [Int]) -> String {
        return sizes.map { "\($0)" }.joined(separator: ", ")
    }

    private func widthOfLabel(_ labelText: String) -> CGFloat {
        return CGFloat(16 + labelText.count * 8)
    }

    func setViews() {
        sizesLabel.backgroundColor = UIColor(white: 1, alpha: 0.8)
        sizesLabel.textAlignment = .center
        sizesLabel.layer.cornerRadius = 16
        sizesLabel.clipsToBounds = true
    }

    func setConstraints() {
        addSubview(shoesImageView)
        addSubview(sizesLabel)

        let stack = UIStackView(
            views: [titleLabel, priceLabel], axis: .vertical, spacing: 10,
            aligment: .leading)

        addSubview(stack)
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        sizesLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.layer.shadowOpacity = 0.4
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowRadius = 3
        stack.layer.shadowOffset = .zero

        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            sizesLabel.widthAnchor.constraint(equalToConstant: 140),
            sizesLabel.heightAnchor.constraint(equalToConstant: 32),
            sizesLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -20),
            sizesLabel.rightAnchor.constraint(
                equalTo: rightAnchor, constant: -8),

        ])
        NSLayoutConstraint.activate([
            shoesImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shoesImageView.leftAnchor.constraint(equalTo: leftAnchor),
            shoesImageView.topAnchor.constraint(equalTo: topAnchor),
            shoesImageView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
