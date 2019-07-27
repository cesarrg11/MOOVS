//
//  HomePresenter.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Home manager
class HomePresenter: HomePresenterProtocol {

    
    //MARK: - Properties
    
    
    /// Interactor
    var interactor: HomeInputInteractorProtocol?
    
    
    /// View
    var view: HomeViewProtocol?
    
    
    /// WireFrame
    var wireframe: HomeRouterProtocol?
    
    
    /// Select media
    var selectedMedia:MediaType?
    
    
    /// Selected category
    var selectCategory:MediaCategory?
    
    
    

    
    /// View did load
    func viewDidLoad() {
        self.selectedMedia = .movie
        self.selectCategory = .popular
        view?.hideUpcoming(hide: true)
        interactor?.getMediaList(type: self.selectedMedia!, category: self.selectCategory!)
    }
    
    
    
    /// TabBar item selected
    ///
    /// - Parameter item: Item selected
    func tabBarSelected(ItemSelected item: Int) {
        let type:MediaType = item == Int() ? .movie : .tvShow
        if (type != selectedMedia){
            view?.hideUpcoming(hide: type == .movie)
            selectCategory = .popular
            self.selectedMedia = type
            interactor?.getMediaList(type:  self.selectedMedia!, category: self.selectCategory!)
        }
        
    }
    
    
    /// Category selected
    ///
    /// - Parameter item: Item selected
    func categoryBarSeleted(ItemSelected item: Int) {
        var categrory = MediaCategory.popular
        switch item {
        case Int():
            categrory = .popular
            break
            
        case 1:
            categrory = .topRated
            break
            
        case 2:
            categrory = .upcoming
            break
            
        default:
            break
        }
        self.selectCategory = categrory
        interactor?.getMediaList(type: self.selectedMedia!, category: self.selectCategory!)
    }
    
    
    
    /// Media selected
    ///
    /// - Parameters:
    ///   - media: Item selected
    ///   - viewRef: Reference view
    func mediaSelected(ItemSelected media: MediaProtocol,viewRef:UIViewController) {
        wireframe?.goToDetail(media: media,viewRef: viewRef)
    }
    
    

    
}


// MARK: - HomeOutputInteractorProtocol

/// HomeOutputInteractorProtocol implementation
extension HomePresenter: HomeOutputInteractorProtocol{
    func mediaListFetched(mediaList: [MediaProtocol]) {
        view?.showMediaList(mediaList: mediaList)
    }
}
