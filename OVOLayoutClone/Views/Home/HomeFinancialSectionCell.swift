//
//  HomeFinancialSectionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeFinancialSectionCell: UITableViewCell {
    
    public static let identifier = "HomeFinancialSectionCell"
    
    // MARK: - UI
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Finansial Kamu"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cardView = HomeFinancialCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.addSubviews(
            sectionTitleLabel,
            cardView
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        sectionTitleLabel.pin(to: contentView, horizontal: 16)
        
        cardView.pin(to: contentView, horizontal: 16)
        cardView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 16).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
}
