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
        return UIScreen.main.bounds.size.width
    }
    private var currentSelectedIndex: Int = 0
    
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
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 100)
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
    
    private func moveToTab(at index: Int) {
        tabCollectionView.scrollToItem(
            at: IndexPath(item: index, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
        tabCollectionView.visibleCells.enumerated().forEach { (cellIndex, cell) in
            if let cell = cell as? HomeProductServiceTabCell {
                if index == cellIndex {
                    cell.onSelectedCell()
                } else {
                    cell.onUnselectedCell()
                }
            }
        }
        currentSelectedIndex = index
    }
    
    private func moveToBody(of category: String) {
        guard let index = categories.firstIndex(of: category) else { return }
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.bodyCollectionView.contentOffset.x = -16 * (CGFloat(index) + 1) + (CGFloat(index) * self.bodyCollectionView.frame.size.width)
        }
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
            cell.configure(
                withCategory: categories[indexPath.item],
                isSelected: indexPath.item == currentSelectedIndex
            )
            
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == tabCollectionView else { return }
        moveToTab(at: indexPath.item)
        moveToBody(of: categories[indexPath.item])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / bodyCollectionView.frame.size.width))
        moveToTab(at: index)
        moveToBody(of: categories[index])
    }
    
}
