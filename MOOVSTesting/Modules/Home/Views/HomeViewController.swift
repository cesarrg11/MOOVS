//
//  HomeViewController.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// HomeViewController class
class HomeViewController: BaseViewController, HomeViewProtocol {

    //MARK: - Properties
    
    var backImageView: UIImageView?
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var categorySegmentControl: UISegmentedControl!
    
    /// Table view
    @IBOutlet weak var mediaTableView: UITableView!
    
    /// Presenter
    var presenter: HomePresenterProtocol?
    
    /// Data source
    var mediaList = [MediaProtocol]()
    
    
    //MARK: - Private
    
    /// Update UI
    ///
    /// - Parameter mediaList: Media list
    func showMediaList(mediaList: [MediaProtocol]) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.mediaList = mediaList
            self.mediaTableView.reloadData()
        }
    }
    
    

    
    func hideUpcoming(hide: Bool) {
        self.categorySegmentControl.removeAllSegments()
        self.categorySegmentControl.insertSegment(withTitle: "popular".localized(), at: Int(), animated: true)
        self.categorySegmentControl.insertSegment(withTitle: "topRated".localized(), at: 1, animated: true)
        if(hide){
            self.categorySegmentControl.insertSegment(withTitle: "upcoming".localized(), at: 2, animated: true)
        }
        self.categorySegmentControl.selectedSegmentIndex = Int()
    }
    
    
    //MARK: - Cycle view
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAnimation()
        mediaTableView.rowHeight = 166
        HomeWireframe.createMediaList(mediaListRef: self)
        presenter?.viewDidLoad()

        
        let moviesItem = UITabBarItem(title: "movies".localized(), image: UIImage(named: "slate_icon"), selectedImage: UIImage(named: "slate_icon")!)
        moviesItem.tag = Int()
        let tvItem = UITabBarItem(title: "tvShow".localized(), image: UIImage(named: "tv_icon"), selectedImage: UIImage(named: "tv_icon")!)
        tvItem.tag = 1
        
        self.tabBar.delegate = self
        self.tabBar.setItems([moviesItem,tvItem], animated: true)
        
        self.tabBar.selectedItem = self.tabBar.items?.first
        
        
    }
    
    @IBAction func segementedControlItemSelected(_ sender: Any) {
        self.isLoading = true
        presenter?.categoryBarSeleted(ItemSelected: self.categorySegmentControl.selectedSegmentIndex)
    }
}


