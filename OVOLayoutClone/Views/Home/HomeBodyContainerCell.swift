//
//  HomeBodyContainerCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeBodyContainerCell: UITableViewCell {
    
    public static let identifier = "HomeBodyContainerCell"
    
    enum Sections: CaseIterable {
        case productServices
        case banners
        case recommendations
        case financial
        case suggestions
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 96, right: 0)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.showsVerticalScrollIndicator = false

        tableView.register(
            HomeProductServicesSectionCell.self,
            forCellReuseIdentifier: HomeProductServicesSectionCell.identifier
        )
        tableView.register(
            HomeBannersSectionCell.self,
            forCellReuseIdentifier: HomeBannersSectionCell.identifier
        )
        tableView.register(
            HomeRecommendationsSectionCell.self,
            forCellReuseIdentifier: HomeRecommendationsSectionCell.identifier
        )
        tableView.register(
            HomeFinancialSectionCell.self,
            forCellReuseIdentifier: HomeFinancialSectionCell.identifier
        )
        tableView.register(
            HomeSuggestionsSectionCell.self,
            forCellReuseIdentifier: HomeSuggestionsSectionCell.identifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        layer.cornerRadius = 20
        contentView.addSubview(tableView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func addConstraints() {
        tableView.pin(to: contentView)
    }
    
}

extension HomeBodyContainerCell: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: HomeProductServicesSectionCell.identifier,
                    for: indexPath
                ) as? HomeProductServicesSectionCell
            else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: HomeBannersSectionCell.identifier,
                    for: indexPath
                ) as? HomeBannersSectionCell
            else {
                return UITableViewCell()
            }
            
            return cell
        case 2:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: HomeRecommendationsSectionCell.identifier,
                    for: indexPath
                ) as? HomeRecommendationsSectionCell
            else {
                return UITableViewCell()
            }
            
            return cell
        case 3:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: HomeFinancialSectionCell.identifier,
                    for: indexPath
                ) as? HomeFinancialSectionCell
            else {
                return UITableViewCell()
            }
            
            return cell
        case 4:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: HomeSuggestionsSectionCell.identifier,
                    for: indexPath
                ) as? HomeSuggestionsSectionCell
            else {
                return UITableViewCell()
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = section == 0 ? .white : .ovoSecondaryBackground
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

}
