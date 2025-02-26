//
//  CartCell.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

protocol CartCellDelegate: AnyObject {
    func remoweShoes(shoeId: String)
    func changeShoesCount(shoeId: String, count: Int)
}

class CartCell: UICollectionViewCell {
    static let reusedID = "CartCell"

    weak var delegate: CartCellDelegate?
    private let shoesImageView = UIImageView(
        customImage: .adidas, contentMode: .scaleAspectFill, cornerRadius: 20)
    private let titleLabel = UILabel(fontSize: 28, lines: 2, isBold: true)
    private let priceLabel = UILabel()
    private let sizesLabel = UILabel(fontSize: 18)
    private let stepperLabel = UILabel()
    private let stepper = UIStepper()
    private let sumPriceLabel = UILabel(fontSize: 22, isBold: true)
    private let deleteBtn = UIButton()
    private var id = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        configureDeleteBtn()
        configureStepperBtn()
    }

    private func configureStepperBtn() {
        stepper.minimumValue = 1
        stepper.maximumValue = 100
        stepper.stepValue = 1
        stepper.addTarget(
            self, action: #selector(stepperValueChanged(_:)), for: .valueChanged
        )
    }

    private func configureDeleteBtn() {
        deleteBtn.addTarget(
            self, action: #selector(onDelete), for: .touchUpInside)
    }

    @objc
    func stepperValueChanged(_ sender: UIStepper) {
        delegate?.changeShoesCount(shoeId: id, count: Int(sender.value))
    }

    @objc
    func onDelete() {
        delegate?.remoweShoes(shoeId: id)
    }

    func setupCell(shoe: CartPosition) {
        self.id = shoe.id
        shoesImageView.image = UIImage(named: shoe.shoes.imgTitle)
        titleLabel.text = shoe.shoes.title
        priceLabel.text = "\(shoe.shoes.price) $"
        sizesLabel.text = "Size: \(shoe.size)"
        stepperLabel.text = "\(shoe.count)"
        stepper.value = Double(shoe.count)
        sumPriceLabel.text = "Price: \(shoe.count * shoe.shoes.price) $"
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }

    private func setViews() {
        backgroundColor = .clear
        deleteBtn.setBackgroundImage(UIImage(systemName: "trash"), for: .normal)
        deleteBtn.tintColor = .systemRed
        deleteBtn.backgroundColor = .clear
    }

    private func setConstraints() {
        addSubview(shoesImageView)
        addSubview(sumPriceLabel)
        contentView.addSubview(deleteBtn)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(stepper)
        addSubview(stepperLabel)
        addSubview(sizesLabel)

        sumPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepperLabel.translatesAutoresizingMaskIntoConstraints = false
        sizesLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stepperLabel.leftAnchor.constraint(
                equalTo: shoesImageView.rightAnchor, constant: 10),
            stepperLabel.centerYAnchor.constraint(
                equalTo: stepper.centerYAnchor),
            stepperLabel.topAnchor.constraint(
                equalTo: priceLabel.bottomAnchor, constant: 20),
            stepper.leftAnchor.constraint(
                equalTo: stepperLabel.rightAnchor, constant: 40),
        ])
        NSLayoutConstraint.activate([
            sumPriceLabel.leftAnchor.constraint(
                equalTo: shoesImageView.rightAnchor, constant: 10),
            sumPriceLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            shoesImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shoesImageView.leftAnchor.constraint(equalTo: leftAnchor),
            shoesImageView.topAnchor.constraint(equalTo: topAnchor),
            shoesImageView.widthAnchor.constraint(equalToConstant: 160),
        ])
        NSLayoutConstraint.activate([
            deleteBtn.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -20),
            deleteBtn.rightAnchor.constraint(
                equalTo: rightAnchor, constant: -10),
            deleteBtn.widthAnchor.constraint(equalToConstant: 30),
            deleteBtn.heightAnchor.constraint(equalToConstant: 30),
        ])
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(
                equalTo: shoesImageView.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(
                equalTo: rightAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(
                equalTo: shoesImageView.rightAnchor, constant: 10),
            priceLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            sizesLabel.topAnchor.constraint(
                equalTo: stepperLabel.bottomAnchor, constant: 20),
            sizesLabel.leftAnchor.constraint(
                equalTo: shoesImageView.rightAnchor, constant: 10),
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
