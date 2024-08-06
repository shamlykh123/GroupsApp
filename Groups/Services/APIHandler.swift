//
//  APIHandler.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation

class APIHandler {
    
    /// Get groups data
    /// - Parameter url: url description
    /// - Returns: Group list data
    func getGroups(url: URL?) async throws -> GroupListData? {
        guard let url = url else {
            return nil
        }
        let (data , _) =  try await URLSession.shared.data(for: URLRequest(url: url))
        let groupList = try JSONDecoder().decode(GroupListData.self, from: data)
        return groupList
    }
}
