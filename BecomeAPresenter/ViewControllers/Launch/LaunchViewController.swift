//
//  LaunchViewController.swift
//  BecomeAPresenter
//
//  Created by Hashaam Siddiq on 7/30/20.
//  Copyright © 2020 HC Studios. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension LaunchViewController {
    func setupViews() {
        addRequestCameraAuthorizationView()
    }
    
    func addRequestCameraAuthorizationView() {
        let requestCameraAuthorizationView = RequestCameraAuthorizationView()
        requestCameraAuthorizationView.translatesAutoresizingMaskIntoConstraints = false
        requestCameraAuthorizationView.delegate = self
        view.addSubview(requestCameraAuthorizationView)
        NSLayoutConstraint.activate([
            requestCameraAuthorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestCameraAuthorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            requestCameraAuthorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestCameraAuthorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LaunchViewController: RequestCameraAuthorizationViewDelegate {
    func requestCameraAuthorizationActionButtonTapped() {
        print("request camera authorization button tapped")
    }
}
