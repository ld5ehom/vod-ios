//
//  HomeViewController.swift
//  Vod-ios
//
//  Created by TaeWook Park on 9/9/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // ViewModel to manage data for the home screen
    private let homeViewModel: HomeViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    /**
     Called when the view is loaded into memory.
     */
    private func setupTableView() {
        self.tableView.register(
            UINib(nibName: "HomeHeaderCell", bundle: .main),
            forCellReuseIdentifier: HomeHeaderCell.identifier
        )
        self.tableView.register(
            UINib(nibName: "HomeVideoCell", bundle: .main),
            forCellReuseIdentifier: HomeVideoCell.identifier
        )
        self.tableView.register(
            UINib(nibName: "HomeRecommendContainerCell", bundle: .main),
            forCellReuseIdentifier: HomeRecommendContainerCell.identifier
        )
        self.tableView.register(
            UINib(nibName: "HomeFooterCell", bundle: .main),
            forCellReuseIdentifier: HomeFooterCell.identifier
        )
        
        // Home Trending Now Ranking
        self.tableView.register(
            UINib(nibName: HomeTrendingContainerCell.identifier, bundle: nil),
            forCellReuseIdentifier: HomeTrendingContainerCell.identifier
        )
        
        // Home recent view
        self.tableView.register(
            UINib(nibName: HomeRecentWatchContainerCell.identifier, bundle: .main),
            forCellReuseIdentifier: HomeRecentWatchContainerCell.identifier
        )
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "empty")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

/**
 "Returns the number of sections in the table view, which corresponds to the number of cases in the HomeSection enum."
 */
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeSection.allCases.count
    }
    
    /**
     Returns the number of rows for each section depending on its type.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        switch section {
        case .header:
            return 1
        case .trending:
            return 1
        case .video:
            return 2
        case .recommend:
            return 1
        case .recentWatch:
            return 1
        case .footer:
            return 1
        }
    }
    
    
    /**
     Returns the height for each row in the sections, based on predefined heights from each cell class.
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return 0
        }
        switch section {
        case .header:
            return HomeHeaderCell.height
        case .trending:
            return HomeTrendingContainerCell.height
        case .video:
            return HomeVideoCell.height
        case .recommend:
            return HomeRecommendContainerCell.height
        case .recentWatch:
            return HomeRecentWatchContainerCell.height
        case .footer:
            return HomeFooterCell.height
        }
    }
    
    
    /**
     Configures and returns the appropriate cell for each section.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return tableView.dequeueReusableCell(withIdentifier: "empty", for: indexPath)
        }
        
        switch section {
        case .header:
            return tableView.dequeueReusableCell(
                withIdentifier: HomeHeaderCell.identifier,
                for: indexPath
            )
            
        // Trend now dequeue
        case .trending:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTrendingContainerCell.identifier,
                for: indexPath
            )
            // delegate
            (cell as? HomeTrendingContainerCell)?.delegate = self
            return cell
            
        case .video:
            return tableView.dequeueReusableCell(
                withIdentifier: HomeVideoCell.identifier,
                for: indexPath
            )
        case .recommend:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeRecommendContainerCell.identifier,
                for: indexPath
            )
            (cell as? HomeRecommendContainerCell)?.delegate = self
            return cell
            
        case .recentWatch:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeRecentWatchContainerCell.identifier,
                for: indexPath
            )
            (cell as? HomeRecentWatchContainerCell)?.delegate = self
            return cell
            
        case .footer:
            return tableView.dequeueReusableCell(
                withIdentifier: HomeFooterCell.identifier,
                for: indexPath
            )
        }
    }
}

/**
 Called when an item in the recommendation section is selected.
 */
extension HomeViewController: HomeRecommendContainerCellDelegate {
    func homeRecommendContainerCell(_ cell: HomeRecommendContainerCell, didSelectItemAt index: Int) {
        print("home recommend cell did select item at \(index)")
    }
}

// Handles user interaction with the trending section
extension HomeViewController: HomeTrendingContainerCellDeleate {
    func homeTrendingContainerCell(_ cell: HomeTrendingContainerCell, didSelectItemAt index: Int) {
        print("User selected trending item at position \(index)")
    }
}

// User Watch history section
extension HomeViewController: HomeRecentWatchContainerCellDelegate {
    
    func homeRecentWatchContainerCell(_ cell: HomeRecentWatchContainerCell, didSelectItemAt index: Int) {
        print("home recent watch did select at \(index)")
    }
}
