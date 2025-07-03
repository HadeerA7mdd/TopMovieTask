//
//  BaseViewController.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    var frame = CGRect()
    var activityIndicatorView = NVActivityIndicatorView(frame: CGRect())
    private var loadingImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frame = CGRect(x: self.view.frame.width / 2 , y: self.view.frame.height / 2, width: 0, height: 0)
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballScale)
        activityIndicatorView.color = UIColor.clear
        activityIndicatorView.padding = 100
        self.view.addSubview(activityIndicatorView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
}
