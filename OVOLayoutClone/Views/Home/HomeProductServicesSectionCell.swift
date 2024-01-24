//
//  HomeProductServiceContainerCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeProductServicesSectionCell: UITableViewCell {
    
    public static let identifier = "HomeProductServicesSectionCell"
    
    private var productServices: [ProductService] = Service.shared.load(from: "productServiceData.json") ?? []
    private var categories: [String] = [
        "Favorite",
        "Other",
        "Grab",
        "Financial"
    ]
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    // MARK: - UI
    
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = CGSize(width: 30, height: 36)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            HomeProductServiceTabCell.self,
            forCellWithReuseIdentifier: HomeProductServiceTabCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var bodyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: (screenWidth - 32 - 24 ) / 4,
            height: 80
        )
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            HomeProductServiceCell.self,
            forCellWithReuseIdentifier: HomeProductServiceCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubviews(
            tabCollectionView,
            bodyCollectionView
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tabCollectionView.heightAnchor.constraint(equalToConstant: 36),
            tabCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            tabCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tabCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            
            bodyCollectionView.heightAnchor.constraint(equalToConstant: 200),
            bodyCollectionView.topAnchor.constraint(equalTo: tabCollectionView.bottomAnchor, constant: 32),
            bodyCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            bodyCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            bodyCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
}

extension HomeProductServicesSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case tabCollectionView:
            return categories.count
        case bodyCollectionView:
            return productServices.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case tabCollectionView:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeProductServiceTabCell.identifier,
                    for: indexPath
                ) as? HomeProductServiceTabCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: categories[indexPath.item])
            
            return cell
        case bodyCollectionView:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeProductServiceCell.identifier,
                    for: indexPath
                ) as? HomeProductServiceCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(withProductService: productServices[indexPath.item])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (collectionView.frame.size.width - (16*2) - (8*3)) / 4 , height: 80)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
