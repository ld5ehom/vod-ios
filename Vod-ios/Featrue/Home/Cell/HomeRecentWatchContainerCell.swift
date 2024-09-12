//
//  HomeRecentWatchContainerCell.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/11/24.
//

import UIKit

// Protocol to handle item selection in HomeRecentWatchContainerCell
protocol HomeRecentWatchContainerCellDelegate: AnyObject {
    
    func homeRecentWatchContainerCell(_ cell: HomeRecentWatchContainerCell, didSelectItemAt index: Int)
}

class HomeRecentWatchContainerCell: UITableViewCell {

    static let identifier: String = "HomeRecentWatchContainerCell"
    static let height: CGFloat = 209
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Delegate to handle item selection
    weak var delegate: HomeRecentWatchContainerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure collection view appearance
        self.collectionView.layer.cornerRadius = 10
        self.collectionView.layer.borderWidth = 1
        self.collectionView.layer.borderColor = UIColor(named: "uclaDarkerBlue")?.cgColor
        
        // Register the custom cell for reuse
        self.collectionView.register(
            UINib(nibName: HomeRecentWatchItemCell.identifier, bundle: .main),
            forCellWithReuseIdentifier: HomeRecentWatchItemCell.identifier
        )
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeRecentWatchContainerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Return the number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    // Configure and return the cell for a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeRecentWatchItemCell.identifier,
            for: indexPath
        )
        
        return cell
    }
    
    // Handle item selection and notify the delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.homeRecentWatchContainerCell(self, didSelectItemAt: indexPath.item)
    }
}
