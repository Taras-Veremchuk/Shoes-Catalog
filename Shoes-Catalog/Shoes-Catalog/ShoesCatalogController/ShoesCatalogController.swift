//
//  ShoesCatalogController.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class ShoesCatalogController: UIViewController {
    let mainView = ShoesCatalogView()
    var shoes = Shoes.getMockData()
    weak var cart: CartController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupCatalog()
    }

    func setupCatalog() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }

}

extension ShoesCatalogController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let vc = DetailController()
        vc.shoes = shoes[indexPath.item]
        vc.delegate = cart
        self.present(vc, animated: true)
    }
}

extension ShoesCatalogController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return shoes.count
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let currentShoes = shoes[indexPath.item]
        if (indexPath.item + 1) % 3 == 0 {
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BigShoesCell.reusedID, for: indexPath)
                    as? BigShoesCell
            else {
                return UICollectionViewCell()
            }
            cell.setupCell(shoe: currentShoes)

            return cell
        } else {
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ShoesCell.reusedID, for: indexPath)
                    as? ShoesCell
            else {
                return UICollectionViewCell()
            }
            cell.setupCell(shoe: currentShoes)

            return cell
        }
    }
}

extension ShoesCatalogController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if (indexPath.item + 1) % 3 == 0 {
            return .init(width: view.frame.width - 16, height: 240)
        } else {
            return .init(width: view.frame.width / 2 - 16, height: 240)
        }
    }
}
