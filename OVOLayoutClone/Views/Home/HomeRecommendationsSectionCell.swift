//
//  HomeRecommendationsSectionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeRecommendationsSectionCell: UITableViewCell {
    
    public static let identifier = "HomeRecommendationsSectionCell"
    
    private let items: [Recommendation] = Service.shared.load(from: "recommendationData.json") ?? []
    private let itemSpacing: CGFloat = 16
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rekomendasi Pilihan"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private lazy var linkLabel: UILabel = {
        let label = UILabel()
        label.text = "Lihat Semua"
        label.textColor = .systemTeal
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var headerTextWrapperView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.addArrangedSubviews(
            sectionTitleLabel,
            linkLabel
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = itemSpacing
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            HomeRecommendationCell.self,
            forCellWithReuseIdentifier: HomeRecommendationCell.identifier
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubviews(
            headerTextWrapperView,
            collectionView
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        headerTextWrapperView.pin(to: contentView, horizontal: 16)
        headerTextWrapperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        collectionView.pin(to: contentView, horizontal: 0)
        collectionView.topAnchor.constraint(equalTo: headerTextWrapperView.bottomAnchor, constant: 16).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: HomeRecommendationCell.itemHeight).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
}

extension HomeRecommendationsSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeRecommendationCell.identifier,
                for: indexPath
            ) as? HomeRecommendationCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: HomeRecommendationCell.itemWidth,
            height: HomeRecommendationCell.itemHeight
        )
    }
    
}


