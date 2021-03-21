//
//  ContactView.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class ClientDetailView: UIView {
    
    weak var viewModel: ClientDetailViewModelType? {
        didSet {
            updateView(with: viewModel)
        }
    }
    
    // MARK: - Properties
    
    private let clientName: UILabel = {
        let label = UILabel()
        label.font = .bold20
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
    
    private let businessNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .gray
        label.font = .light14
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = .bold18
        return label
    }()
    
    private let number: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .gray
        label.font = .medium14
        return label
    }()
    
    private let swipeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(toggleView),
                         for: .touchUpInside)
        return button
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "MissedCall"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 6
        imageView.layer.shadowOpacity = 0.05
        imageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        return imageView
    }()
    
    private var isExpanded: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.3) { [unowned self] in
                let constant: CGFloat = isExpanded ? 270: 180
                containerViewHeightConstraint.constant = constant
                businessNumber.isHidden = !isExpanded
                label.isHidden = !isExpanded
                number.isHidden = !isExpanded
                layoutIfNeeded()
            }
        }
    }
    
    private var containerViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        clientName.text = "Name of contact"
        clientAddress.text = "+1 917 123-4566"
        duration.text = "08:34"
        businessNumber.text = "Business number"
        label.text = "Store"
        number.text = "+1 888 123-5555"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        setupContainerView()
        setupLogoImageView()
        setupDurationLabel()
        setupVerticalStack()
        setupButton()
    }
    
    // MARK: - Setup container view
    
    private func setupContainerView() {
        addSubview(containerView)
        
        containerViewHeightConstraint = containerView
            .heightAnchor
            .constraint(equalToConstant: 180)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerViewHeightConstraint
        ])
    }
    
    // MARK: - Setup vertical stack
    
    private func setupVerticalStack() {
        containerView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(clientName)
        verticalStack.addArrangedSubview(clientAddress)
        verticalStack.addArrangedSubview(businessNumber)
        verticalStack.addArrangedSubview(label)
        verticalStack.addArrangedSubview(number)
        
        verticalStack.setCustomSpacing(4, after: clientName)
        verticalStack.setCustomSpacing(32, after: clientAddress)
        verticalStack.setCustomSpacing(8, after: businessNumber)
        verticalStack.setCustomSpacing(4, after: label)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 80
            ),
            verticalStack.leadingAnchor.constraint(
                equalTo: logoImageView.trailingAnchor,
                constant: 16
            ),
            containerView.trailingAnchor.constraint(
                equalTo: verticalStack.trailingAnchor,
                constant: 40
            )
        ])
    }
    
    // MARK: - Setup logo imageView
    
    private func setupLogoImageView() {
        containerView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 75),
            
            logoImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 16),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            
            logoImageView.heightAnchor.constraint(
                equalTo: logoImageView.widthAnchor)
        ])
        
        containerView.layoutIfNeeded()
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
    }
    
    // MARK: - Setup button
    
    private func setupButton() {
        containerView.addSubview(swipeButton)
        swipeButton.layer.cornerRadius = 3
        
        NSLayoutConstraint.activate([
            swipeButton.widthAnchor.constraint(equalToConstant: 24),
            swipeButton.heightAnchor.constraint(equalToConstant: 6),
            
            swipeButton.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor),
            
            containerView.bottomAnchor.constraint(
                equalTo: swipeButton.bottomAnchor,
                constant: 16)
        ])
    }
    
    // MARK: - Setup durationLabel
    
    private func setupDurationLabel() {
        containerView.addSubview(duration)
        NSLayoutConstraint.activate([
            duration.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: 10),
            
            duration.centerXAnchor.constraint(
                equalTo: logoImageView.centerXAnchor)
        ])
    }
    
    // MARK: - Swiping
    
    @objc private func toggleView() {
        isExpanded.toggle()
    }
    
    private func updateView(with viewModel: ClientDetailViewModelType?) {
        clientName.text = viewModel?.clientName
        clientAddress.text = viewModel?.clientAddress
        duration.text = viewModel?.duration
        label.text = viewModel?.clientLabel
        number.text = viewModel?.number
        
        if clientName.text == nil {
            clientAddress.textColor = .black
            clientAddress.font = .bold20
        }
    }
}
