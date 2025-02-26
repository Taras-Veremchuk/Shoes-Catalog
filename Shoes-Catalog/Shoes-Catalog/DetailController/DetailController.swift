//
//  DetailController.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class DetailController: UIViewController {
    let mainView = DetailView()
    var shoes = Shoes(title: "", price: 0, size: [], imgTitle: "")
    var selectedSize: Int?
    weak var delegate: AddShoesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        mainView.sizesCollectionView.dataSource = self
        mainView.sizesCollectionView.delegate = self
        setupViews()
        setActions()
    }
    
    private func setupViews() {
        mainView.setupView(shoes)
    }
    
    private func setActions() {
        let buyAction =  UIAction { _ in
            
            guard let selectedSize = self.selectedSize else{
                let alert = UIAlertController(title: "Choose size", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            let position = CartPosition(shoes: self.shoes, count: 1, size: selectedSize)
            self.delegate?.addShoes(position)
            self.dismiss(animated: true)
        }
        mainView.addToCartBtn.addAction(buyAction, for: .touchUpInside)
    }
    
}

extension DetailController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoes.size.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SizeCell.reusedID, for: indexPath)
                as? SizeCell
        else {
            return UICollectionViewCell()
        }
        let currentSize = shoes.size[indexPath.item]
        cell.sizeLabel.text = currentSize.description
        if let selectedSize {
            cell.backgroundColor = selectedSize == currentSize ? .init(named: "btnColor") ?? .blue : .white
        }
        return cell
    }
}

extension DetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 56, height: 40)
    }
}

extension DetailController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedSize = shoes.size[indexPath.item]
        mainView.sizesCollectionView.reloadData()
    }
}
