//
//  DetailView.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class DetailView: UIView {
    let addToCartBtn = UIButton(title: "Add To Bin", bgColor: UIColor(named: "btnColor") ?? .blue, cornerRadius: 30, height: 60)
    let imageView = UIImageView(customImage: .adidas, contentMode: .scaleAspectFill, cornerRadius: 20)
    let titleLabel = UILabel(fontSize: 24, isBold: true)
    var sizesCollectionView: UICollectionView!
    let priceLabel = UILabel(fontSize: 20)
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    func setupView(_ shoe: Shoes) {
        titleLabel.text = shoe.title
        priceLabel.text = "\(shoe.price) $"
        imageView.image = UIImage(named: shoe.imgTitle)
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
        imageView.clipsToBounds = true
        backgroundColor = .white
    }
    
    private func setConstraints() {
        let stack = UIStackView(views: [imageView, titleLabel, priceLabel, sizesCollectionView, addToCartBtn], axis: .vertical, spacing: 12, aligment: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
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
