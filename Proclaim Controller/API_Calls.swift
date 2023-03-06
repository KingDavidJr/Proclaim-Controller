//
//  API_Calls.swift
//  Proclaim Controller
//
//  Created by David on 3/5/23.
//


let ipaddress: String = "" //Enter IP Address
let port: String = "52195"
let urlPerform: String = "http://\(ipaddress):\(port)/appCommand/perform?appCommandName=" // URL for the performances
var funcName:String = ""

import Foundation

// gets the proclaimAuthToken -- Use for machines that are not on local machines
func apiAuthCall() {
    guard let url = URL(string: "http://\(ipaddress):\(port)/appCommand/authenticate") else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Authorization")
    let body: [String: AnyHashable] = [
        "Password": "proclaim"
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            print(response)
        }
        catch {
            print(error)
        }
    }
        task.resume()
    }

// changes slide to the next slide
func nextSlide() {
    funcName = "nextSlide"
    guard let url = URL(string: urlPerform + funcName) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url)
    task.resume()
}

// changes slide to the previous slide
func prevSlide() {
    funcName = "previousSlide"
    guard let url = URL(string: urlPerform + funcName) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url)
    task.resume()
}

// puts presentation on air
func goOnAir() {
    funcName = "goOnAir"
    guard let url = URL(string: urlPerform + funcName) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url)
    task.resume()
}

// puts presentation off air
func goOffAir() {
    funcName = "goOffAir"
    guard let url = URL(string: urlPerform + funcName) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url)
    task.resume()
}

// handles how the token is returned
struct Response: Codable {
    let proclaimAuthToken: String
}
