//
//  HomeCarouselBodyCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 25/01/24.
//

import UIKit

final class HomeCarouselBodyCell: UICollectionViewCell {
    
    public static let identifier = "HomeCarouselBodyCell"
    public static let itemWidth: CGFloat = UIScreen.main.bounds.size.width - 48
    public static let itemHeight: CGFloat = 120
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .ovoSecondaryBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.frame
    }
    
    
    public func configure(with image: String) {
        imageView.image = UIImage(named: image)
    }
    
}
