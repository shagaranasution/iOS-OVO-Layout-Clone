//
//  HomeFinancialCardView.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 30/01/24.
//

import UIKit

final class HomeFinancialCardView: UIView {
    
    // MARK: - UI
    
    private lazy var ovoLabel: UILabel = {
        let label = UILabel()
        label.text = "OVO"
        label.textColor = .purpleOVOMain
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var investLabel: UILabel = {
        let label = UILabel()
        label.text = "Invest"
        label.textColor = .purpleOVOMain
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var verticalBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .purpleOVOMain
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        return view
    }()
    
    private lazy var footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Saatnya kamu mulai investasi dengan yang aman dan pasti"
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var footerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Mulai", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let attributedText: NSAttributedString = NSAttributedString(
            string: "Mulai",
            attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        )
        
        button.titleLabel?.attributedText = attributedText
        button.backgroundColor = .purpleOVOMain
        button.contentEdgeInsets = UIEdgeInsets(
            top: 8,
            left: 24,
            bottom: 8,
            right: 24
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var horizontalDeviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupContainerUI()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerShadow()
        footerButton.layer.cornerRadius = footerButton.bounds.height / 2
    }
    
    private func setupContainerUI() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupContainerShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: 0,
                width: self.frame.width,
                height: self.frame.height
            ),
            cornerRadius: 10
        ).cgPath
    }
    
    private func addSubviews() {
        addSubviews(
            ovoLabel,
            investLabel,
            verticalBarView,
            horizontalDeviderView,
            footerLabel,
            footerButton
        )
    }
    
    private func addConstraints() {
        verticalBarView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        verticalBarView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        ovoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        ovoLabel.trailingAnchor.constraint(equalTo: verticalBarView.leadingAnchor, constant: -8).isActive = true
        
        investLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        investLabel.leadingAnchor.constraint(equalTo: verticalBarView.trailingAnchor, constant: 8).isActive = true
        
        horizontalDeviderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        horizontalDeviderView.topAnchor.constraint(equalTo: verticalBarView.bottomAnchor, constant: 16).isActive = true
        
        footerLabel.topAnchor.constraint(equalTo: horizontalDeviderView.bottomAnchor, constant: 24).isActive = true
        footerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        footerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        
        footerButton.centerYAnchor.constraint(equalTo: footerLabel.centerYAnchor).isActive = true
        footerButton.leadingAnchor.constraint(equalTo: footerLabel.trailingAnchor, constant: 16).isActive = true
        footerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
}
