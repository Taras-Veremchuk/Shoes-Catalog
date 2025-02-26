//
//  CartController.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

protocol AddShoesDelegate: AnyObject {
    func addShoes(_ position: CartPosition)
}

class CartController: UIViewController {
    let mainView = CartView()
    var positions: [CartPosition] = [] {
        didSet {
            print("Shoes list")
            positions.forEach { position in
                print(position.shoes.title)
            }
            print("---------")

            if !positions.isEmpty {
                self.tabBarItem.badgeValue = positions.count.description
                self.tabBarItem.badgeColor = .red
            } else {
                self.tabBarItem.badgeValue = positions.count.description
                self.tabBarItem.badgeColor = .clear
            }
            mainView.cartCollectionView.reloadData()
            mainView.updateTotalPrice(positions)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        navigationController?.isNavigationBarHidden = false
        title = "Bin"
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension CartController: AddShoesDelegate {
    func addShoes(_ position: CartPosition) {
        self.positions.append(position)
        setupCatalog()
    }

    func setupCatalog() {
        mainView.cartCollectionView.dataSource = self
        mainView.cartCollectionView.delegate = self
    }
}

extension CartController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        positions.count
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CartCell.reusedID, for: indexPath)
                as? CartCell
        else {
            return UICollectionViewCell()
        }
        if !positions.isEmpty {
            let currentShoes = positions[indexPath.item]
            cell.setupCell(shoe: currentShoes)
        }
        cell.delegate = self
        return cell
    }

}

extension CartController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(width: view.frame.width - 16, height: 280)
    }
}

extension CartController: CartCellDelegate {
    func changeShoesCount(shoeId: String, count: Int) {
        let index = self.positions.firstIndex { String($0.id) == shoeId }
        if let index {
            self.positions[index].count = count
        }
    }

    func remoweShoes(shoeId: String) {
        let index = self.positions.firstIndex { String($0.id) == shoeId }
        if let index {
            self.positions.remove(at: index)
        }
    }
}
