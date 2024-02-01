//
//  HomeProductServiceCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 22/01/24.
//

import UIKit

final class HomeProductServiceCell: UICollectionViewCell {
    
    public static let identifier = "HomeProductServiceCell"
    
    private let colors: [[CGColor]] = [
        [UIColor.blueSmoked.cgColor, UIColor.white.cgColor],
        [UIColor.purpleOVOMain.cgColor, UIColor.white.cgColor],
        [UIColor.systemPink.cgColor, UIColor.white.cgColor],
        [UIColor.systemTeal.cgColor, UIColor.white.cgColor],
        [UIColor.blue.cgColor, UIColor.white.cgColor],
        [UIColor.orange.cgColor, UIColor.white.cgColor],
        [UIColor.red.cgColor, UIColor.white.cgColor],
    ]
    
    private var imageViewSize: CGFloat {
        return 40
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageViewSize/2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: imageViewSize, 
            height: imageViewSize
        )
        gradientLayer.colors = colors.randomElement()!
        imageView.layer.addSublayer(gradientLayer)
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(
            imageView,
            label
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: imageViewSize),
            imageView.heightAnchor.constraint(equalToConstant: imageViewSize),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            label.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
        ])
    }
    
    public func configure(withProductService productService: ProductService) {
        label.text = productService.name
    }
    
}
