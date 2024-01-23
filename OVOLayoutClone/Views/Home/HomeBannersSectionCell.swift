//
//  HomeBannersSectionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeBannersSectionCell: UITableViewCell {
    
    public static let identifier = "HomeBannersSectionCell"
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.clipsToBounds = true
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(view)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        view.pin(to: contentView)
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
}

