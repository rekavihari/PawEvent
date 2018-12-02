import Foundation
import Alamofire

enum Endpoints: String {
    case events = "events"
    case program = "programs"
    case location = "geos"
    case message = "messages"
}

typealias ResponseType = ((Data?, Error?) -> Void)?

class NetworkService {

    static let shared = NetworkService()

    private let baseUrl = URL(string:"http://192.168.1.104:8080/api/")

    private let parameters: Parameters = [
        "username": UserDefaults.standard.getUsername()
        ]

    

    private let headers: HTTPHeaders = ["Authorization":UserDefaults.standard.getToken()]

    // Singleton, tehat nem lehet belole tobbet letrehozni, ezert privat az init
    private init () {}

    func get(endpoint: Endpoints, completion: ResponseType) {
        guard let baseUrl = baseUrl, let url = URL(string: "\(baseUrl)\(endpoint.rawValue)") else { return }
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

            if let data = response.data {
                completion?(data, nil)
            }
        }
    }

    func post(endpoint: Endpoints, parameters: [String: Any], completion: ResponseType) {
        guard let baseUrl = baseUrl, let url = URL(string: "\(baseUrl)\(endpoint.rawValue)") else { return }
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in

            if let data = response.data {
                completion?(data, nil)
            }

        }
    }
}
