import Foundation
import Alamofire

enum Endpoints: String {
    case events = "events"
    case program = "programs"
}

typealias ResponseType = ((Data?, Error?) -> Void)?

class NetworkService {

    static let shared = NetworkService()

    private let baseUrl = URL(string:"http://localhost:8080/api/")
    private let parameters: Parameters = [
        "username": UserDefaults.standard.getUsername(),
        "password": UserDefaults.standard.getPassword()]
    private let headers: HTTPHeaders = ["Authorization":UserDefaults.standard.getToken()]

    // Singleton, tehat nem lehet belole tobbet letrehozni, ezert privat az init
    private init () {}

    func get(endpoint: Endpoints, completion: ResponseType) {
        guard let baseUrl = baseUrl, let url = URL(string: "\(baseUrl)\(endpoint.rawValue)") else { return }
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

            // Ha hiba van a lekerdezesben
            if response.response?.statusCode ?? 300 > 299 {
                completion?(nil, response.error)
            } else if let data = response.data {
                completion?(data, nil)
            }

//            switch response.result {
//            case .success(let value):
//                if let value = response.result.value {
//                    print(response)
//                    let json = JSON(value)
//                    print(json.arrayValue[0]["name"].stringValue)
//                    self.nameLabel.text = json.arrayValue[0]["name"].stringValue
//                    self.startLabel.text = json.arrayValue[0]["startDate"].stringValue
//                    self.endLabel.text = json.arrayValue[0]["endDate"].stringValue
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
        }
    }
}
