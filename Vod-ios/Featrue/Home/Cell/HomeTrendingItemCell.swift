//
//  HomeTrendingItemCell.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/11/24.
//

import UIKit

class HomeTrendingItemCell: UICollectionViewCell {
    
    // Identifier for Reuse
    static let identifier: String = "HomeTrendingItemCell"

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // Called when the cell is loaded from the .xib or storyboard
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
    }
    
    // Prepares the cell for reuse by clearing any existing data
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.numberLabel.text = nil
    }
    
    // Sets the rank number for the cell
    func setRank(_ rank: Int) {
        self.numberLabel.text = "\(rank)"
    }

}
