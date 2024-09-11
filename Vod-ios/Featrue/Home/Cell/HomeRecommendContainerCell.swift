//
//  HomeRecommendContainerCell.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/11/24.
//

import UIKit

protocol HomeRecommendContainerCellDelegate: AnyObject {
    func homeRecommendContainerCell(_ cell: HomeRecommendContainerCell, didSelectItemAt index: Int)
}

class HomeRecommendContainerCell: UITableViewCell {

    static let identifier: String = "HomeRecommendContainerCell"
    
    // height
    static var height: CGFloat {
        let top: CGFloat = 84 - 6 // Distance from the first cell to the bottom - top margin of the cell
        let bottom: CGFloat = 68 - 6 // Distance from the first cell to the bottom - bottom margin of the cell
        let footerInset: CGFloat = 51 // Padding from the container to the footer
        return HomeRecommendItemCell.height * 5 + top + bottom + footerInset
    }

    // table 
    @IBOutlet weak var tableView: UITableView!
    
    // container
    @IBOutlet weak var containerView: UIView!
    
    // fold button
    @IBOutlet weak var foldButton: UIButton!
    weak var delegate: HomeRecommendContainerCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(named: "uclaDarkestBlue")?.cgColor
        self.tableView.rowHeight = HomeRecommendItemCell.height
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: "HomeRecommendItemCell", bundle: .main),
            forCellReuseIdentifier: HomeRecommendItemCell.identifier
        )
    }

    // fold button did tap
    @IBAction func foldButtonDidTap(_ sender: Any) {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeRecommendContainerCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: HomeRecommendItemCell.identifier, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.homeRecommendContainerCell(self, didSelectItemAt: indexPath.row)
    }
}

