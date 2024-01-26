//
//  CustomCollectionViewFlowLayout.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 26/01/24.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = self.collectionView else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            return latestOffset
        }
        
        // Page width used for estimating and calculating paging.
        let pageWidth = self.itemSize.width + self.minimumInteritemSpacing
        
        // Make an estimation of the current page position.
        let approximatePage = collectionView.contentOffset.x/pageWidth
        
        // Determine the current page based on velocity.
        let currentPage =
        if velocity.x == 0 { round(approximatePage) }
        else if velocity.x < 0.0 { floor(approximatePage) }
        else { ceil(approximatePage) }
        
        // Create custom flickVelocity.
        let flickVelocity = velocity.x * 0.3
        
        // Check how many pages the user flicked, if <= 1 then flickedPages should return 0.
        let flickedPages: CGFloat =
        if abs(round(flickVelocity)) <= 1.0 { 0.0 }
        else { round(flickVelocity) }
        
        // Calculate newHorizontalOffset.
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - collectionView.contentInset.left
        
        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
    
}
