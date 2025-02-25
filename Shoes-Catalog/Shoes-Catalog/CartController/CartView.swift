//
//  CartView.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

final class CartView: UIView {
    private let bottomView = UIView()
    var cartCollectionView: UICollectionView!
    private let totalLabel = UILabel()
    var totalPriceLabel = UILabel()
    private let buyBtn = UIButton(title: "Order Now", bgColor: UIColor(named: "btnColor") ?? .blue)
    
    init() {
        super.init(frame: .zero)
        totalLabel.text = "Total"
        totalLabel.font = .boldSystemFont(ofSize: 28)
        totalPriceLabel.font = .boldSystemFont(ofSize: 28)
        totalPriceLabel.text = "0 $"
        bottomView.backgroundColor = .white
        setupCollectionView()
        setConstraints()
    }
    
    func updateTotalPrice(_ positions: [CartPosition]) {
        var totalPrice = 0
        positions.forEach { position in
            totalPrice += Int(position.count) * Int(position.shoes.price)
        }
        totalPriceLabel.text = "\(totalPrice) $"
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.cartCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cartCollectionView.showsVerticalScrollIndicator = false
        cartCollectionView.showsHorizontalScrollIndicator = false
        
        cartCollectionView.backgroundColor = .clear
        cartCollectionView.register(CartCell.self, forCellWithReuseIdentifier: CartCell.reusedID)
        cartCollectionView.contentInset = .init(top: 0, left: 3, bottom: 125, right: 3)
    }
    
    private func setConstraints() {
        addSubview(cartCollectionView)
        cartCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cartCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cartCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cartCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cartCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: rightAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 125)
        ])
        bottomView.addSubview(buyBtn)
        buyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buyBtn.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10),
            buyBtn.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 8),
            buyBtn.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -8)
        ])
        
        let stackTotalPtice = UIStackView(views: [totalLabel, totalPriceLabel], axis: .horizontal, spacing: 25, aligment: .fill)
        bottomView.addSubview(stackTotalPtice)
        stackTotalPtice.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackTotalPtice.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 8),
            stackTotalPtice.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -8),
            stackTotalPtice.bottomAnchor.constraint(equalTo: buyBtn.topAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
