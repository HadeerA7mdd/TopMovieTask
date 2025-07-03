//
//  HomeTableViewCell.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var favBTN: UIButton!
    @IBOutlet weak var movieImg: UIImageView!
    
    var addFavBtnHandler : (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func favBtnTapped(_ sender: Any) {
        addFavBtnHandler?()
    }
    
    func cellSetup(data: Movie?){
        self.movieName.text = data?.title ?? ""
        movieDate.text = data?.releaseDate ?? ""
        movieRate.text = "\(data?.voteAverage ?? 0)"
        self.movieImg.sd_setImage(with: data?.posterURL, placeholderImage: UIImage(named: "logo"))
        if data?.isFav == true{
            favBTN.setImage(UIImage(named: "fav"), for: .normal)
        }else{
            favBTN.setImage(UIImage(named: "unFav"), for: .normal)
        }
 
    }
}
