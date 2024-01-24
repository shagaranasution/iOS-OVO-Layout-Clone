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
        label.textColor = .purpleOVOMain
        label.clipsToBounds = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .ovoSecondaryBackground
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 14
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        label.pin(to: contentView, horizontal: 16, vertical: 8)
    }
    
    public func configure(withCategory category: String, isSelected: Bool) {
        label.text = category
        if isSelected {
            onSelectedCell()
        } else {
            onUnselectedCell()
        }
    }
    
    public func onSelectedCell() {
        contentView.backgroundColor = .ovoSecondaryBackground
        contentView.layer.cornerRadius = 14
        label.textColor = .purpleOVOMain
    }
    
    public func onUnselectedCell() {
        contentView.backgroundColor = .clear
        contentView.isOpaque = true
        label.textColor = .unselectedItemTint
    }
    
}
