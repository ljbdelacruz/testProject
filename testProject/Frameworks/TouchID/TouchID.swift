//
//  TouchID.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 27/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import LocalAuthentication

public protocol ILJTouchID{
    func successTouchID();
    func getError(err:Error?)
}

class LJTouchID{
    var handler:ILJTouchID?;
    var localization:String?
    init(handler:ILJTouchID, message:String){
        self.handler=handler;
        self.localization=message;
    }
    
    func authenticateUserTouchID() {
        let context : LAContext = LAContext()
        var authError: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: self.localization!) { success, evaluateError in
                if success // IF TOUCH ID AUTHENTICATION IS SUCCESSFUL, NAVIGATE TO NEXT VIEW CONTROLLER
                {
                    self.handler?.successTouchID();
                }
                else // IF TOUCH ID AUTHENTICATION IS FAILED, PRINT ERROR MSG
                {
                    self.handler?.getError(err: evaluateError);
                }
            }
        }
    }
//    4. Print error message on Touch ID Authentication Failure
//    func showErrorMessageForLAErrorCode( errorCode:Int ) -> String{
//
//        var message = ""
//
//        switch errorCode {
//
//        case LAError.AppCancel.rawValue:
//            message = "Authentication was cancelled by application"
//
//        case LAError.AuthenticationFailed.rawValue:
//            message = "The user failed to provide valid credentials"
//
//        case LAError.InvalidContext.rawValue:
//            message = "The context is invalid"
//
//        case LAError.PasscodeNotSet.rawValue:
//            message = "Passcode is not set on the device"
//
//        case LAError.SystemCancel.rawValue:
//            message = "Authentication was cancelled by the system"
//
//        case LAError.TouchIDLockout.rawValue:
//            message = "Too many failed attempts."
//
//        case LAError.TouchIDNotAvailable.rawValue:
//            message = "TouchID is not available on the device"
//
//        case LAError.UserCancel.rawValue:
//            message = "The user did cancel"
//
//        case LAError.UserFallback.rawValue:
//            message = "The user chose to use the fallback"
//
//        default:
//            message = "Did not find error code on LAError object"
//
//        }
//
//        return message
//
//    }
}
