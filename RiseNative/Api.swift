//
//  Api.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//
//
import Foundation
import SwiftUI

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum MyError: Error {
    case badParsing
    case badRequest
    case networkError(Error)
    case invalidHTTPStatusCode
}


func makeApiCall<T>(endpoint: String, method: HTTPMethod, body: [String: Any]? = nil) async throws -> T? where T : Decodable {
  
    if let url = URL(string:  endpoint) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if(body != nil){
            request.httpBody = try JSONSerialization.data(withJSONObject: body!)
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw error
   
        }
    }
    return nil
}
