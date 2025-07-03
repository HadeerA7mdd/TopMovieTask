//
//  ViewController.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var homeTable: UITableView!
    
    var homeViewModelProtocol: HomeViewModelProtocol = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bindViewModel()
        homeViewModelProtocol.getMovie()
    }

    
    func bindViewModel(){
        homeViewModelProtocol.bindSucessResultToViewController = { [weak self] in
            self?.activityIndicatorView.stopAnimating()
           self?.homeTable.reloadData()
        }
        
        homeViewModelProtocol.bindErrorResultToViewController = { [weak self] msg in
            self?.activityIndicatorView.stopAnimating()
            self?.makeOkAlert(title: msg, SubTitle: "", Image: UIImage())
        }
        
        homeViewModelProtocol.showLoadingIndicator = { [weak self] isLoading in
            DispatchQueue.main.async { [weak self]  in
                if isLoading {
                    self?.activityIndicatorView.startAnimating()
                } else {
                    self?.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
    
}

