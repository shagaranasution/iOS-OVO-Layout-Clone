//
//  HomeBannersSectionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeBannersSectionCell: UITableViewCell {
    
    public static let identifier = "HomeBannersSectionCell"
    
    private var timer: Timer?
    private let items: [String] = [
        "carousel_image.jpg",
        "carousel_image.jpg",
        "carousel_image.jpg",
        "carousel_image.jpg",
    ]
    private var currentIndex = 0
    private var itemSpacing: CGFloat { 8 }
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var carouselBodiesCollectionView: UICollectionView = {
        let layout = CustomCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: HomeCarouselBodyCell.itemWidth,
            height: HomeCarouselBodyCell.itemHeight
        )
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        collectionView.register(
            HomeCarouselBodyCell.self,
            forCellWithReuseIdentifier: HomeCarouselBodyCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var carouselIndicatorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: HomeCarouselIndicatorCell.size,
            height: HomeCarouselIndicatorCell.size
        )
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsSelection = false
        collectionView.register(
            HomeCarouselIndicatorCell.self,
            forCellWithReuseIdentifier: HomeCarouselIndicatorCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.addSubviews(
            carouselBodiesCollectionView,
            carouselIndicatorsCollectionView
        )
        addConstraints()
        startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    deinit {
        timer = nil
    }
    
    private func addConstraints() {
        carouselBodiesCollectionView.heightAnchor.constraint(equalToConstant: HomeCarouselBodyCell.itemHeight).isActive = true
        carouselBodiesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        carouselBodiesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        carouselBodiesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        carouselIndicatorsCollectionView.widthAnchor.constraint(equalToConstant: (HomeCarouselIndicatorCell.size + itemSpacing) * CGFloat(items.count)).isActive = true
        carouselIndicatorsCollectionView.heightAnchor.constraint(equalToConstant: HomeCarouselIndicatorCell.size).isActive = true
        carouselIndicatorsCollectionView.topAnchor.constraint(equalTo: carouselBodiesCollectionView.bottomAnchor, constant: 16).isActive = true
        carouselIndicatorsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        carouselIndicatorsCollectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 2.0,
            target: self,
            selector: #selector(moveItem),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    private func moveItem() {
        currentIndex += 1
        if currentIndex > items.count - 1 {
            currentIndex = 0
        }
        moveToBody(at: currentIndex)
        selectIndicator(at: currentIndex)
    }
    
    private func moveToBody(at index: Int) {
        carouselBodiesCollectionView.scrollToItem(
            at: IndexPath(item: index, section: 0),
            at: .right,
            animated: true
        )
    }
    
    private func selectIndicator(at index: Int) {
        carouselIndicatorsCollectionView
            .visibleCells
            .enumerated()
            .forEach { (cellIndex, cell) in
                guard 
                    let cell = cell as? HomeCarouselIndicatorCell
                else { return }
                if cellIndex == index {
                    cell.onSelected()
                } else {
                    cell.onUnselected()
                }
        }
    }
    
}

extension HomeBannersSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case carouselBodiesCollectionView:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCarouselBodyCell.identifier,
                    for: indexPath
                ) as? HomeCarouselBodyCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: items[indexPath.item])
            
            return cell
        case carouselIndicatorsCollectionView:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCarouselIndicatorCell.identifier,
                    for: indexPath
                ) as? HomeCarouselIndicatorCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: indexPath.item == currentIndex)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / (carouselBodiesCollectionView.frame.size.width - 48)))
        selectIndicator(at: index)
        currentIndex = index
    }
    
}

