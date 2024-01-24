//
//  HomeHeaderMenuItemView.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 23/01/24.
//

import UIKit

final class HomeHeaderMenuItemView: UIView {
    
    private var image: UIImage {
        didSet {
            imageView.image = image
        }
    }
    private var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.isOpaque = true
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public init(
        frame: CGRect = .zero,
        image: UIImage,
        title: String
    ) {
        self.image = image
        self.title = title
        super.init(frame: frame)
        setupContainer()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupContainer() {
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.isOpaque = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        titleLabel.pin(to: self, horizontal: 0)
    }
    
}
