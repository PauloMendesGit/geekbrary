//
//  Networking.swift
//  geekbrary
//
//  Created by Paulo Mendes on 04/03/2023.
//

import Foundation

class NetworkRequest {
    func getJSONFromURL(url: URL, completion: @escaping (Data?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error getting JSON data: \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                print("Error: no data received")
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }

    func decode(_ data: Data) -> [String: Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return json as? [String: Any]
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}





