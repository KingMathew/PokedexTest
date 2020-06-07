import Foundation
import Alamofire
import SwiftyJSON

class Webservices {

    static var session: Alamofire.Session {
        get {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = TimeInterval(240)
            let sessionManager = Session(configuration: configuration)
            return sessionManager
        }
    }

    



    static func requestGet(url: String, callbackSuccess: @escaping (AnyObject) -> (), callbackFail: @escaping (AnyObject) -> ()) {

        AF.request(url).validate().responseJSON { response in

            switch response.result {
            case .success(let value):
                callbackSuccess(value as AnyObject)
            case .failure(let error):
                callbackFail(error as AnyObject)
            }
        }
    }





}
