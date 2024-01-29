//
//  HomeRecommendationCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 29/01/24.
//

import UIKit

final class HomeRecommendationCell: UICollectionViewCell {
    
    public static let identifier = "HomeRecommendationCell"
    public static let itemWidth: CGFloat = 150
    public static let itemHeight: CGFloat = 100 + 48 + 12 + 34 + 14
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .ovoSecondaryBackground
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.text = "OVO"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .purpleOVOMain
        
        return label
    }()
    
    private lazy var wrapperStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .equalSpacing
        view.addArrangedSubviews(
            imageView,
            titleLabel,
            subtitleLabel,
            brandLabel
        )
        
        return view
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(wrapperStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        wrapperStackView.frame = contentView.frame
    }
    
    public func configure(with recommendation: Recommendation) {
        self.imageView.image = UIImage(named: recommendation.image)
        self.titleLabel.text = recommendation.service
        self.subtitleLabel.text = recommendation.subtitle
        self.brandLabel.text = recommendation.brand
        self.layoutIfNeeded()
    }
    
}
