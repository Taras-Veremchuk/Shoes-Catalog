//
//  DetailView.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class DetailView: UIView {
    let addToCartBtn = UIButton(title: "Add To Bin", bgColor: UIColor(named: "btnColor") ?? .blue)
    let imageView = UIImageView()
    let titleLabel = UILabel()
    var sizesCollectionView: UICollectionView!
    let priceLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.sizesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        sizesCollectionView.showsVerticalScrollIndicator = false
        sizesCollectionView.showsHorizontalScrollIndicator = false
        addSubview(sizesCollectionView)
        sizesCollectionView.backgroundColor = .clear
        sizesCollectionView.register(SizeCell.self, forCellWithReuseIdentifier: SizeCell.reusedID)
        sizesCollectionView.contentInset = .init(top: 0, left: 3, bottom: 0, right: 3)
    }
    
    private func setViews() {
        setupCollectionView()
        titleLabel.font = .boldSystemFont(ofSize: 24)
        priceLabel.font = .systemFont(ofSize: 20)
        imageView.image = .adidas
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        backgroundColor = .white
    }
    
    private func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel, priceLabel, sizesCollectionView, addToCartBtn])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 12
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        NSLayoutConstraint.activate([
            sizesCollectionView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
