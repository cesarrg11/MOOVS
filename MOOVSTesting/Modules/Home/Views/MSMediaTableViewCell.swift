//
//  MSMediaTableViewCell.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media Cell
class MSMediaTableViewCell: UITableViewCell {

    
    /// Name label
    @IBOutlet weak var nameLabel: UILabel!
    
    
    /// Media image
    @IBOutlet weak var mediaImage: UIImageView!
    
    
    /// Vote average label
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    
    /// Date label
    @IBOutlet weak var dateLabel: UILabel!
    

    
    /// Media object
    var media: MediaProtocol?{
        didSet{
            fillUI()
        }
    }
    
    
    /// Service to get image
    private var imageService:ImageServiceProtocol? = ServiceLocator.resolve()
    
    
    /// Fill UI
    private func fillUI(){
        if let _media = self.media{
            
            if let movieMedia = _media as? MovieMedia{
                self.nameLabel.text = movieMedia.title ?? String()
                self.dateLabel.text = movieMedia.releaseDate ?? String()
            }
            
            if let tvMedia = _media as? TVShowMedia{
                self.nameLabel.text = tvMedia.name ?? String()
                self.dateLabel.text = "\(tvMedia.firstAirDate ?? String())"
            }
            
            self.voteAverageLabel.text = "\("voteAverage".localized()): \(_media.voteAverage ?? Double())"
            
            DispatchQueue.main.async {
                self.mediaImage.image = self.imageService?.get(identifier: _media.posterPath ?? String())
            }
            
        }
    }
    
    
    /// Prepare objects for reuse
    override func prepareForReuse() {
        self.mediaImage.image = .movieAvatar
    }
}
