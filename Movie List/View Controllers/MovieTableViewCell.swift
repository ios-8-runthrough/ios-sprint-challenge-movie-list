//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Alex Shillingford on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol SeenDelegate {
    func isSeenChanged()
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var seenButtonLabel: UIButton!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    var delegate: SeenDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seenButtonTapped(_ sender: UIButton) {
        movie?.isSeen.toggle()
        delegate?.isSeenChanged()
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        
        seenButtonLabel.setTitle(movie.isSeen ? "Seen" : "Not Seen", for: .normal)
    }
}
