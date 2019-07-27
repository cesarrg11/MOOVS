//
//  HomeViewControllerExtension.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/7/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    /// Number of sections
    ///
    /// - Parameter tableView: TableViewReference
    /// - Returns: Sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /// Numbers of rows by sections
    ///
    /// - Parameters:
    ///   - tableView: TableView Reference
    ///   - section: Current
    /// - Returns: Rows for sections
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    
    /// Build cell
    ///
    /// - Parameters:
    ///   - tableView: TableView reference
    ///   - indexPath: Current indexPath
    /// - Returns: Builded cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as? MSMediaTableViewCell else{
            return UITableViewCell()
        }
        cell.media = mediaList[indexPath.row]
        cell.setNeedsUpdateConstraints()
        cell.updateFocusIfNeeded()
        return cell
    }
    
    
    /// Called cell is selected
    ///
    /// - Parameters:
    ///   - tableView: TableView reference
    ///   - indexPath: Current indexPath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.mediaSelected(ItemSelected: self.mediaList[indexPath.row],viewRef: self)
    }
    
}



// MARK: - Animations
extension HomeViewController{
    
    /// Animation
    public func createAnimation() {
        self.backImageView = UIImageView(image: UIImage(named: "splash"))
        self.backImageView?.frame = self.view.frame
        self.backImageView?.tag = 1001
        self.parent?.view.addSubview(self.backImageView!)
        UIView.animate(withDuration: 1.2) {
            guard let image = self.parent?.view.subviews.first(where:{$0.tag == 1001}) else{
                assertionFailure()
                return
            }
            image.transform = CGAffineTransform(translationX: 0, y: -image.frame.height)
        }
    }
    
}


// MARK: - UITabBarDelegate


/// Extension for manage tabbar
extension HomeViewController : UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.isLoading = true
        self.presenter?.tabBarSelected(ItemSelected: item.tag)
    }
}


