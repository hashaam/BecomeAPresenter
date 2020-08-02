//
//  RequestCameraAuthorizationView.swift
//  BecomeAPresenter
//
//  Created by Hashaam Siddiq on 7/30/20.
//  Copyright © 2020 HC Studios. All rights reserved.
//

import UIKit

protocol RequestCameraAuthorizationViewDelegate: class {
    func requestCameraAuthorizationActionButtonTapped()
}

class RequestCameraAuthorizationView: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var cameraImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    
    weak var delegate: RequestCameraAuthorizationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func actionButtonHandler(btn: UIButton) {
        delegate?.requestCameraAuthorizationActionButtonTapped()
    }

}
