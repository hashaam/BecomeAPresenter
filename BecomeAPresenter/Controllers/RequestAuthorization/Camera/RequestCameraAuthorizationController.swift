//
//  RequestCameraAuthorizationController.swift
//  BecomeAPresenter
//
//  Created by Hashaam Siddiq on 8/3/20.
//  Copyright © 2020 HC Studios. All rights reserved.
//

import Foundation
import AVFoundation

enum CameraAuthorizationStatus {
    case notRequested
    case granted
    case unauthorized
}

typealias RequestCameraAuthorizationCompletionHandler = (CameraAuthorizationStatus) -> Void

class RequestCameraAuthorizationController {
    
    static func requestCameraAuthorization(completionHandler: @escaping RequestCameraAuthorizationCompletionHandler) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
            DispatchQueue.main.async {
                guard granted else {
                    completionHandler(.unauthorized)
                    return
                }
                completionHandler(.granted)
            }
        })
    }
    
    static func getCameraAuthorizationStatus() -> CameraAuthorizationStatus {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized: return .granted
        case .notDetermined: return .notRequested
        default: return .unauthorized
        }
    }
    
}
