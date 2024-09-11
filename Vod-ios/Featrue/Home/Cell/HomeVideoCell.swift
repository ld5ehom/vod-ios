//
//  HomeVideoCell.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/10/24.
//

import UIKit

class HomeVideoCell: UITableViewCell {

    static let identifier: String = "HomeVideoCell"
    static let height: CGFloat = 320
    
    // Main Container View
    @IBOutlet weak var containerView: UIView!
    
    // Thumbnail Image View
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // Hot Image View
    @IBOutlet weak var hotImageView: UIImageView!
    
    // Title Label
    @IBOutlet weak var titleLabel: UILabel!
    
    // Title Subtitle Label
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // Channel Image View
    @IBOutlet weak var channelImageView: UIImageView!
    
    // Channel Title Label
    @IBOutlet weak var channelTitleLabel: UILabel!
    
    // Channel Subtitle Label
    @IBOutlet weak var channelSubtitleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(named: "uclaDarkerBlue")?.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
