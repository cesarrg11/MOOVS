//
//  HomeWireframe.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Home wireframe
class HomeWireframe: HomeRouterProtocol {
    
    
    
    /// Go to detail
    ///
    /// - Parameters:
    ///   - media: Media selected
    ///   - viewRef: From view
    func goToDetail(media: MediaProtocol,viewRef: UIViewController) {
        viewRef.performSegue(withIdentifier: "goToDetail", sender: media)
    }
    
    
    
    /// Create Home module
    ///
    /// - Parameter mediaListRef: HomeViewController
    public class func createMediaList(mediaListRef:HomeViewController){
        let presenter : HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        mediaListRef.presenter = presenter
        mediaListRef.presenter?.wireframe = HomeWireframe()
        mediaListRef.presenter?.view = mediaListRef
        mediaListRef.presenter?.interactor = HomeInteractor()
        mediaListRef.presenter?.interactor?.presenter = presenter
    }
    
    
    
}


// MARK: - Extension

/// Extension for navigate
extension HomeViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController: DetailViewController = segue.destination as? DetailViewController{
            DetailWireFrame.createDetailModule(detailRef: viewController, media: (sender as? MovieMedia) ?? (sender as? TVShowMedia)!)
        }
    }
}
