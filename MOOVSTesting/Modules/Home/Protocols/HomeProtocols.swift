//
//  HomeProtocols.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

//MARK: - View

/// HomewViewProtocol
protocol HomeViewProtocol:class {
    func showMediaList(mediaList:[MediaProtocol])
    func hideUpcoming(hide:Bool)
}

//MARK: - Presenter

/// HomePresenterProtocol
protocol HomePresenterProtocol: class{

    var interactor: HomeInputInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var wireframe: HomeRouterProtocol? {get set}
    
    
    func viewDidLoad()
    func tabBarSelected(ItemSelected item: Int)
    func categoryBarSeleted(ItemSelected item: Int)
    func mediaSelected(ItemSelected media: MediaProtocol,viewRef:UIViewController)
}

//MARK: - Interactor


/// Input interactor
protocol HomeInputInteractorProtocol: class {
    var presenter: HomeOutputInteractorProtocol? {get set}
    func getMediaList(type: MediaType , category:MediaCategory)
}


/// Output interactor
protocol HomeOutputInteractorProtocol: class {
    func mediaListFetched(mediaList:[MediaProtocol])
}

//MARK: - Router

/// HomeRouterProtocol
protocol HomeRouterProtocol: class {
    func goToDetail(media:MediaProtocol,viewRef: UIViewController)
}

