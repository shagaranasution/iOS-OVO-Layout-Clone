//
//  HomeCarouselIndicatorCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 25/01/24.
//

import UIKit

final class HomeCarouselIndicatorCell: UICollectionViewCell {
    
    public static let identifier = "HomeCarouselIndicatorCell"
    
    public static let size: CGFloat = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = CGRect(
            x: 0,
            y: 0,
            width: Self.size,
            height: Self.size
        )
    }
    
    private func setupContainer() {
        contentView.backgroundColor = .unselectedItemTint
        contentView.layer.cornerRadius = contentView.frame.size.height/2
    }
    
    public func configure(with isSelected: Bool) {
        if isSelected {
            onSelected()
        } else {
            onUnselected()
        }
    }
    
    public func onSelected() {
        contentView.backgroundColor = .systemTeal
    }
    
    public func onUnselected() {
        contentView.backgroundColor = .unselectedItemTint
    }
    
}
