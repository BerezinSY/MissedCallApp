//
//  ContactCell.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class ClientCell: UICollectionViewCell {
    
    weak var clientCellViewModel: ClientCellViewModelType? {
        didSet {
            updateView(with: clientCellViewModel)
        }
    }
    
    static var id: String { "ContactCell" }
    
    private let clientName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let clientAddress: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .medium14
        return label
    }()
    
    private let duration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .light12
        return label
    }()
    
    private let created: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .light12
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MissedCall"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.cornerRadius = 8
        setup()

        clientName.text = "Name of contact"
        clientAddress.text = "+1 800 123-4567"
        duration.text = "08:34"
        created.text = "10:21 AM"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupLogoImageView()
        setupVerticalStack()
        setupHorizontalStack()
    }
    
    private func setupLogoImageView() {
        addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(
                equalTo: topAnchor, constant: 16),
            
            logoImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 8),
            
            logoImageView.widthAnchor.constraint(
                equalToConstant: 48),
            
            logoImageView.heightAnchor.constraint(
                equalTo: logoImageView.widthAnchor)
        ])
        
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
        layoutIfNeeded()
    }
    
    private func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(clientName)
        verticalStack.addArrangedSubview(clientAddress)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16),
            
            verticalStack.leadingAnchor.constraint(
                equalTo: logoImageView.trailingAnchor,
                constant: 8),
            
            trailingAnchor.constraint(
                equalTo: verticalStack.trailingAnchor,
                constant: 8)
        ])
    }
    
    private func setupHorizontalStack() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(duration)
        horizontalStack.addArrangedSubview(created)
        
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            bottomAnchor.constraint(
                equalTo: horizontalStack.bottomAnchor,
                constant: 8),
            trailingAnchor.constraint(
                equalTo: horizontalStack.trailingAnchor,
                constant: 16)
        ])
    }
    
    private func updateView(with viewModel: ClientCellViewModelType?) {
        clientName.text = viewModel?.clientName
        clientAddress.text = viewModel?.clientAddress
        duration.text = viewModel?.duration
        created.text = viewModel?.created
        
        if clientName.text == nil {
            clientAddress.textColor = .black
        }
    }
}
