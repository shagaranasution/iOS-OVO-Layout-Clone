//
//  HomeSuggestionsSectionCell.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 20/01/24.
//

import UIKit

final class HomeSuggestionsSectionCell: UITableViewCell {
    
    public static let identifier = "HomeSuggestionsSectionCell"
    
    private var items: [Suggestion] = Service.shared.load(from: "suggestionData.json") ?? []
    private let itemSpacing: CGFloat = 16
    private let collectionViewInset: CGFloat = 16
    private var itemWidth: CGFloat {
        return (UIScreen.main.bounds.size.width - (collectionViewInset*2) - itemSpacing) / 2
    }
    private var itemHeight: CGFloat {
        return itemWidth * 0.4 + 16 + 46 + 14 + 12 + 8 + 16 + 16
    }
    
    // MARK: - UI
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Yang Menarik di OVO"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var sectionSubitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Jangan ngaku update kalau belum cobain fitur ini"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(
            top: 4,
            left: collectionViewInset,
            bottom: collectionViewInset,
            right: collectionViewInset
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(
            HomeSuggestionCell.self,
            forCellWithReuseIdentifier: HomeSuggestionCell.identifier
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.addSubviews(
            sectionTitleLabel,
            sectionSubitleLabel,
            collectionView
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        sectionTitleLabel.pin(to: contentView, horizontal: 16)
        sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        sectionSubitleLabel.pin(to: contentView, horizontal: 16)
        sectionSubitleLabel.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 4).isActive = true
        
        collectionView.pin(to: contentView, horizontal: 0)
        collectionView.topAnchor.constraint(equalTo: sectionSubitleLabel.bottomAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: itemHeight * ceil(CGFloat((items.count/2))) + 112).isActive = true
    }
}

extension HomeSuggestionsSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeSuggestionCell.identifier,
                for: indexPath
            ) as? HomeSuggestionCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: itemWidth,
            height: itemHeight
        )
    }
    
}

