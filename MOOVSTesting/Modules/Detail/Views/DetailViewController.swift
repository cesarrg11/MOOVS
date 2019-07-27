//
//  DetailView.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit
import YouTubePlayer


/// Detail view controller
class DetailViewController: UIViewController, DetailViewProtocol {
    
    //MARK: - Properties
    
    var tvImageView:UIImageView!
    var overviewTextView: UITextView!
    var contentMediaView: UIView!
    
    
    var contentSize:CGSize {
       return CGSize(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height * 0.25)
    }
    
    var textSize:CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height * 0.70)
    }
    
    
    var presenter:DetailPresenterProtocol?
    
    
    //MARK: - Private
    
    
    /// Create imageView object
    private func CreateImageView(){
        self.tvImageView = UIImageView(image: .notContent)
        self.tvImageView.frame.size = contentSize
        self.tvImageView.contentMode = .scaleAspectFill
        self.view.addSubview(tvImageView)
    }
    
    
    
    /// Set image
    ///
    /// - Parameter image: Image
    private func SetContentMediaView(image:String){
        self.tvImageView.setImage(url: image)
    }
    
    
    /// Create textview object
    private func CreateTextView(){
        self.overviewTextView = UITextView(frame: CGRect(origin: CGPoint(x: CGFloat(), y: self.tvImageView.frame.height + 8), size: textSize))
        self.overviewTextView.isUserInteractionEnabled = false
        self.overviewTextView.isSelectable = false
        self.overviewTextView.font = UIFont.systemFont(ofSize: 16.0)
        self.overviewTextView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        self.view.addSubview(overviewTextView)
    }
    
    
    /// Set moview video
    ///
    /// - Parameter identifier: Video indentifier
    private func SetMoviewVideo(identifier:String){
        tvImageView.removeFromSuperview()
        let videPlayer = YouTubePlayerView(frame: CGRect(origin: CGPoint(x: Int(), y: Int()), size: contentSize))
        videPlayer.contentMode = .scaleAspectFit
        self.view.addSubview(videPlayer)
        videPlayer.loadVideoID(identifier)
    }
    
    
    //MARK: - Override
    
    
    /// View did load
    override func viewDidLoad() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor :UIColor.white]
        self.CreateImageView()
        self.CreateTextView()
        presenter?.viewDidLoad()
        super.viewDidLoad()
    }
    
    
    //MARK: - Public
    
    /// Fill UI with media object
    ///
    /// - Parameter media: Media object
    func showMedia(_ media: MediaProtocol) {
        if let _media = media as? MovieMedia{
            self.title = _media.title ?? String()
        }else if let _media = media as? TVShowMedia{
            self.title = _media.name ?? String()
            self.SetContentMediaView(image: _media.backdropPath ?? String())
        }
        self.overviewTextView.text = media.overview ?? String()
        
    }
    
   
    
    /// Show Video
    ///
    /// - Parameter video: Video identifier
    func showVideo(video: String) {
        DispatchQueue.main.async {
            self.SetMoviewVideo(identifier: video)
        }
        
    }
    
    

}
