import Foundation
import Alamofire

class NetworkingManager {
    static let shared = NetworkingManager()
    private init() {}
    
    private let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    func fetchData(completion: @escaping(Result<DecodableType, Error>) -> ()) {
        AF.request(urlString)
            .validate()
            .response { response in
                guard let data = response.data else {
                    if let error = response.error {
                        completion(.failure(NetworkingErrors.urlError))
                    }
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let exchangeRate = try decoder.decode(DecodableType.self, from: data)
                    completion(.success(exchangeRate))
                } catch {
                    completion(.failure(error))
                }
            }
    }
}

enum NetworkingErrors: Error {
    case urlError, dataError
}
