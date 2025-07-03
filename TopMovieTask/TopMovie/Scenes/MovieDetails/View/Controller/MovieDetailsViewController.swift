//
//  MovieDetailsViewController.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    
    @IBOutlet weak var favBTN: UIButton!
    @IBOutlet weak var langiage: UILabel!
    @IBOutlet weak var voteAvrg: UILabel!
    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var relaseDate: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var movieIMG: UIImageView!
    
    var movieDetailsModelProtocol: MovieDetailsProtocol = MovieDetailsViewModel()
    var movieId : Int = 0
    var movieDataa: MovieDetail?
    var favv : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        movieDetailsModelProtocol.getMovieDeatils(movieID: movieId)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favv = FavoriteManager.shared.isFavorite(movieId: movieId)
    }
    
    @IBAction func favBtnTapped(_ sender: Any) {
        favAction()
    }
    
    
}
