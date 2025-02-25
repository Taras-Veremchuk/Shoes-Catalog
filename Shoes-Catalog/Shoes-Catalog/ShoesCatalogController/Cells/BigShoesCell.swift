//
//  BigShoesCell.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class BigShoesCell: UICollectionViewCell {
        static let reusedID = "BigShoesCell"
        
        let shoesImageView = UIImageView()
        let titleLabel = UILabel()
        let priceLabel = UILabel()
        let sizesLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setViews()
            setConstraints()
        }
        
        func setViews() {
            titleLabel.text = "Назва моделі"
            priceLabel.text = "2344"
            priceLabel.font = .boldSystemFont(ofSize: 48)
            sizesLabel.text = "41, 42, 45, 40"
            titleLabel.font = .systemFont(ofSize: 28)
            shoesImageView.image = UIImage(named: "nike")
            shoesImageView.contentMode = .scaleAspectFill
            shoesImageView.layer.masksToBounds = true
            sizesLabel.backgroundColor  = UIColor(white: 1, alpha: 0.8)
            sizesLabel.textAlignment = .center
            sizesLabel.layer.cornerRadius = 16
            sizesLabel.clipsToBounds = true // обрезать по его внутренним границам
            titleLabel.textColor = .white
            priceLabel.textColor = .white
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
                stack.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            NSLayoutConstraint.activate([
                sizesLabel.widthAnchor.constraint(equalToConstant: 140),
                sizesLabel.heightAnchor.constraint(equalToConstant: 32),
                sizesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
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
