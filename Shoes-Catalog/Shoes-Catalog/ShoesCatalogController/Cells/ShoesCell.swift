//
//  ShoesCell.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class ShoesCell: UICollectionViewCell {
    static let reusedID = "ShoesCell"
    
    let shoesImageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let sizesLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    
    func setupCell(shoe: Shoes, sizesString: String, sizeLabel: CGFloat) { //sizeLabel: CGFloat переробити
        priceLabel.text = "\(shoe.price)zł"
        titleLabel.text = shoe.title
        shoesImageView.image = UIImage(named: shoe.imgTitle)
        sizesLabel.text = sizesString
        sizesLabel.widthAnchor.constraint(equalToConstant: sizeLabel).isActive = true
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }
    
    func setViews() {
        priceLabel.font = .boldSystemFont(ofSize: 22)
        shoesImageView.contentMode = .scaleAspectFill
        shoesImageView.layer.masksToBounds = true
        sizesLabel.backgroundColor  = UIColor(white: 1, alpha: 0.8)
        sizesLabel.textAlignment = .center
        sizesLabel.layer.cornerRadius = 16
        sizesLabel.clipsToBounds = true 
        titleLabel.textColor = .white
        priceLabel.textColor = .white
    }
    
    private func sizeOfLabel(_ sizes: [Int]) -> String {
        var sizesStr = ""
        for (index, size) in sizes.enumerated() {
            sizesStr += size.description
            if index != sizes.count - 1 {
                sizesStr += ", "
            }
        }
        return "String"
    }
    
    func setConstraints() {
        addSubview(shoesImageView)
        addSubview(sizesLabel)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, priceLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        
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
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            sizesLabel.heightAnchor.constraint(equalToConstant: 32),
            sizesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            sizesLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
            
        ])
        NSLayoutConstraint.activate([
            shoesImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shoesImageView.leftAnchor.constraint(equalTo: leftAnchor),
            shoesImageView.topAnchor.constraint(equalTo: topAnchor),
            shoesImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
