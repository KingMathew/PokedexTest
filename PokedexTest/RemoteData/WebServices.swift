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

    public enum METHODS: String {
        case PATH_POKEMON_LIST = "pokemon"
    }



    static func requestGet(pathMethod: METHODS, callbackSuccess: @escaping (AnyObject) -> (), callbackFail: @escaping (AnyObject) -> ()) {

        let host = Globals.URL_BASE
        AF.request(host + pathMethod.rawValue).validate().responseJSON { response in

            switch response.result {
            case .success(let value):
                callbackSuccess(value as AnyObject)
            case .failure(let error):
                callbackFail(error as AnyObject)
            }
        }
    }





}
