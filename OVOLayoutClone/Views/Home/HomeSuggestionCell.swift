//
//  HomeSuggestionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 30/01/24.
//

import UIKit

final class HomeSuggestionCell: UICollectionViewCell {
    
    public static let identifier = "HomeSuggestionCell"
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var linkLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemTeal
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .ovoSecondaryBackground
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 12
        contentView.addSubviews(
            titleLabel,
            subtitleLabel,
            linkLabel,
            thumbnailImageView
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerShadow()
    }
    
    private func setupContainerShadow() {
        layer.shadowOpacity = 0.08
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 7
        layer.shadowPath = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: 0,
                width: contentView.frame.width,
                height: contentView.frame.height
            ),
            cornerRadius: 12
        ).cgPath
    }
    
    private func addConstraints() {
        thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        
        titleLabel.pin(to: contentView, horizontal: 8)
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 12).isActive = true
        
        subtitleLabel.pin(to: contentView, horizontal: 8)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        linkLabel.pin(to: contentView, horizontal: 8)
        linkLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16).isActive = true
        linkLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    public func configure(with suggestion: Suggestion) {
        titleLabel.text = suggestion.title
        subtitleLabel.text = suggestion.subtitle
        linkLabel.text = suggestion.linkText
        thumbnailImageView.image = UIImage(named: suggestion.image)
    }
    
}
