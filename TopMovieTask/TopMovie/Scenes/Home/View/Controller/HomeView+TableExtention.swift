//
//  HomeView+TableExtention.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    
    func setTableView() {
        homeTable.dataSource = self
        homeTable.delegate = self
        homeTable.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModelProtocol.getMovieDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.cellSetup(data: homeViewModelProtocol.getMovieByIndex(index: indexPath.row))
        cell.addFavBtnHandler = { [weak self] in
            self?.homeViewModelProtocol.handleEditMovieFav(index: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        homeViewModelProtocol.paginationAction(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            detailVC.movieId = homeViewModelProtocol.getMovieByIndex(index: indexPath.row)?.id ?? 0
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
