//
//  HttpAuth.swift
//  Nutritics
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import Foundation
import SwiftUI
import Combine

class HttpAuth: ObservableObject {

    @Published var authenticated = false

    func postAuth(username: String, password: String) {
        guard let url = URL(string: "https://\(username):\(password)@www.nutritics.com/api/v1.1/LIST/food=bananna") else { return }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(Welcome.self, from: data)
            
//            if resData.res == "correct" {
//                DispatchQueue.main.async {
//                    self.authenticated = true
//                }
//            }
        }.resume()
    }
}

// MARK: - Welcome
struct Welcome: Codable {
    let the1, the2, the3: The1
    let resultCount, status: Int
    let msg, warning: String
    let queryTime: Int

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case resultCount, status, msg, warning, queryTime
    }
}

// MARK: - The1
struct The1: Codable {
    let id: Int
    let ifc: String
    let userID: Int
    let src, code, name, moddate: String
    let cat: String
    let isLive: Bool
    let barcode: String
    let reporturl: String
    let photo: String
}
