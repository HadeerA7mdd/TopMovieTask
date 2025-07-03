//
//  MovieDetails+FuncExt.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation
import UIKit

extension MovieDetailsViewController{
    func bindViewModel(){
        movieDetailsModelProtocol.bindSucessResultToViewController = { [weak self] in
            self?.activityIndicatorView.stopAnimating()
            self?.movieDataa = self?.movieDetailsModelProtocol.getMovieData()
            if let dataa = self?.movieDataa{
                self?.setupData(data: dataa)
            }
        }
        
        movieDetailsModelProtocol.bindErrorResultToViewController = { [weak self] msg in
            self?.activityIndicatorView.stopAnimating()
            self?.makeOkAlert(title: msg, SubTitle: "", Image: UIImage())
        }
        
        movieDetailsModelProtocol.showLoadingIndicator = { [weak self] isLoading in
            DispatchQueue.main.async { [weak self]  in
                if isLoading {
                    self?.activityIndicatorView.startAnimating()
                } else {
                    self?.activityIndicatorView.stopAnimating()
                }
            }
        }
    }

    
    func setupData(data : MovieDetail){
        name.text = data.title ?? ""
        relaseDate.text = data.releaseDate ?? ""
        overView.text = data.overview ?? ""
        rate.text = "\(data.voteAverage ?? 0)"
        voteAvrg.text = "\(data.popularity ?? 0)"
        langiage.text = data.originalLanguage ?? ""
        movieIMG.sd_setImage(with: data.backdropURL, placeholderImage: UIImage(named: "logo"))
       
        if favv == true{
            favBTN.setImage(UIImage(named: "fav"), for: .normal)
        }else{
            favBTN.setImage(UIImage(named: "unFav"), for: .normal)
        }

    }
    
    func favAction(){
        favv.toggle()
        if favv == true{
            FavoriteManager.shared.saveFavorite(movieId: movieId)
        } else {
            FavoriteManager.shared.removeFavorite(movieId: movieId)
        }
        if let dataa = movieDataa{
            setupData(data: dataa)
        }
    }
    
}
