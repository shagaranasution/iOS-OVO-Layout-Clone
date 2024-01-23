//
//  HomeProductServiceTabCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 22/01/24.
//

import UIKit

final class HomeProductServiceTabCell: UICollectionViewCell {
    
    public static let identifier = "HomeProductServiceTabCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.clipsToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .ovoSecondaryBackground
        contentView.addSubview(label)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 14
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        label.pin(to: contentView, horizontal: 16, vertical: 8)
    }
    
    public func configure(with title: String) {
        label.text = title
    }
    
}
