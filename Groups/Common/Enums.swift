//
//  Enums.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}

enum Urls {
    case groupListUrl
    case groupInfo(id: Int)
    
    var url : URL? {
        switch self {
        case .groupListUrl:
            URL(string: "http://huddle-dev.messej.com/huddles/podium_dummy")
        case .groupInfo(let id):
            URL(string: "http://huddle-dev.messej.com/huddles/podium_dummy/\(id)")
        }
    }
}


