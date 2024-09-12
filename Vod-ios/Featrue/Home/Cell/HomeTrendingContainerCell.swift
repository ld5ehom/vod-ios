//
//  HomeTrendingContainerCell.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/11/24.
//

import UIKit

// Protocol to handle item selection in the HomeTrendingContainerCell
protocol HomeTrendingContainerCellDeleate: AnyObject {
    func homeTrendingContainerCell(_ cell: HomeTrendingContainerCell, didSelectItemAt index: Int)
}

// Custom UITableViewCell representing a trending section with a collection view
class HomeTrendingContainerCell: UITableViewCell {

    static let identifier: String = "HomeTrendingContainerCell"
    static let height: CGFloat = 349
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: HomeTrendingContainerCellDeleate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register HomeTrendingItemCell.xib for the collection view
        self.collectionView.register(
            UINib(nibName: HomeTrendingItemCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: HomeTrendingItemCell.identifier
        )
        // Set data source and delegate for the collection view
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    // Method to handle the selected state of the cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// Extension to handle collection view data source and delegate methods
extension HomeTrendingContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Returns the number of items (5 test trending items)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    // Sets up each collection view cell with a rank
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeTrendingItemCell.identifier,
            for: indexPath
        )
        
        // Set the rank number for the cell
        if let cell = cell as? HomeTrendingItemCell {
            cell.setRank(indexPath.item + 1)
        }
        
        return cell
    }
    
    // Notifies the delegate when a trending item is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.homeTrendingContainerCell(self, didSelectItemAt: indexPath.item)
    }
}
