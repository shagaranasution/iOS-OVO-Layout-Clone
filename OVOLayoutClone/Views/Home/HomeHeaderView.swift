//
//  HomeHeaderView.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 23/01/24.
//

import UIKit

final class HomeHeaderView: UIView {
    
    public let customHeight: CGFloat = 200
    
    private var ovoPointViewWidth: CGFloat { 120 }
    private var ovoPointViewHeight: CGFloat { 28 }
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.size.width - 32,
            height: customHeight - 32
        )
        gradientLayer.cornerRadius = 16
        gradientLayer.colors = [UIColor.purpleOVOMain.cgColor, UIColor.systemTeal.cgColor]
        view.layer.addSublayer(gradientLayer)
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.text = "OVO Cash"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Saldo"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var balanceNumberLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Rp100.000")
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 10, weight: .bold),
            range: NSRange(location: 0, length: 2)
        )
        attributedString.addAttribute(
            .baselineOffset,
            value: 8,
            range: NSRange(location: 0, length: 2)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 16, weight: .bold),
            range: NSRange(location: 2, length: attributedString.length - 2)
        )
        label.attributedText = attributedString
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var ovoPointView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = ovoPointViewHeight/2
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var topUpMenuItemView = HomeHeaderMenuItemView(
        image: UIImage(systemName: "plus.circle.fill")!,
        title: "Top Up"
    )
    
    private lazy var transferMenuItemView = HomeHeaderMenuItemView(
        image: UIImage(systemName: "square.and.arrow.up.on.square.fill")!,
        title: "Transfer"
    )
    
    private lazy var withdrawalMenuItemView = HomeHeaderMenuItemView(
        image: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        title: "Tarik Tunai"
    )
    
    private lazy var historyMenuItemView = HomeHeaderMenuItemView(
        image: UIImage(systemName: "list.bullet.rectangle.fill")!,
        title: "History"
    )
    
    private lazy var menuContainerView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.addArrangedSubviews(
            topUpMenuItemView,
            transferMenuItemView,
            withdrawalMenuItemView,
            historyMenuItemView
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blueSmoked
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCardViewShadow()
    }
    
    private func setupCardViewShadow() {
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowPath = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: 0,
                width: cardView.frame.width,
                height: cardView.frame.height
            ),
            cornerRadius: 16
        ).cgPath
    }
    
    private func setupSubviews() {
        addSubview(cardView)
        cardView.pin(to: self, spacing: 16)
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        
        addSubview(balanceTitleLabel)
        balanceTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        balanceTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        
        addSubview(balanceNumberLabel)
        balanceNumberLabel.topAnchor.constraint(equalTo: balanceTitleLabel.bottomAnchor, constant: 6).isActive = true
        balanceNumberLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        
        addSubview(ovoPointView)
        setupOvoPointView()
        
        addSubview(menuContainerView)
        menuContainerView.topAnchor.constraint(equalTo: ovoPointView.bottomAnchor, constant: 16).isActive = true
        menuContainerView.pin(to: cardView, horizontal: 16)
        menuContainerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16).isActive = true
        
    }
    
    private func setupOvoPointView() {
        ovoPointView.widthAnchor.constraint(equalToConstant: ovoPointViewWidth).isActive = true
        ovoPointView.heightAnchor.constraint(equalToConstant: ovoPointViewHeight).isActive = true
        ovoPointView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        ovoPointView.centerYAnchor.constraint(equalTo: balanceNumberLabel.centerYAnchor).isActive = true
        balanceNumberLabel.trailingAnchor.constraint(equalTo: ovoPointView.leadingAnchor, constant: -16).isActive = true
        
        let pointLabel = UILabel()
        pointLabel.text = "OVO Points"
        pointLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        pointLabel.textColor = .purpleOVOMain
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let pointImageView = UIImageView()
        pointImageView.image = UIImage(
            systemName: "p.circle.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 16)
        )
        pointImageView.contentMode = .scaleAspectFit
        pointImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(
            systemName: "chevron.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 12)
        )
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        ovoPointView.addSubviews(
            pointImageView,
            pointLabel,
            arrowImageView
        )
        pointImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        pointImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        pointImageView.centerYAnchor.constraint(equalTo: ovoPointView.centerYAnchor).isActive = true
        pointImageView.leadingAnchor.constraint(equalTo: ovoPointView.leadingAnchor, constant: 8).isActive = true
        
        pointLabel.leadingAnchor.constraint(equalTo: pointImageView.trailingAnchor, constant: 4).isActive = true
        pointLabel.centerYAnchor.constraint(equalTo: ovoPointView.centerYAnchor).isActive = true
        
        arrowImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        arrowImageView.leadingAnchor.constraint(equalTo: pointLabel.trailingAnchor, constant: -4).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: ovoPointView.trailingAnchor, constant: -8).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: ovoPointView.centerYAnchor).isActive = true
    }
    
}
