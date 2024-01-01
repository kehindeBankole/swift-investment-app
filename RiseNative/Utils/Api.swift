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
    case UnAuthorized
}


func makeApiCall<T>(endpoint: String, method: HTTPMethod, body: [String: Any]? = nil) async throws -> T? where T : Decodable {
    @AppStorage("token") var token: String = ""
    if let url = URL(string:  endpoint) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        if(body != nil){
            request.httpBody = try JSONSerialization.data(withJSONObject: body!)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse , response.statusCode != 401 else {
            throw MyError.UnAuthorized
        }
        
        do{
            let decodedData = try JSONDecoder().decode(T.self, from: data)
          //  print("response", token , response,  decodedData )
            return decodedData
        } catch {
            
            throw MyError.badParsing
            
        }
        
    }
    return nil
}
