//
//  GroupInfo.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation

// MARK: - GroupList
struct GroupListData: Codable {
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let currentPage: Int
    let groups: [Group]
    let nextPage: Bool
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case groups
        case nextPage = "next_page"
        case total
    }
}

// MARK: - Group
struct Group: Codable,Hashable {
    let bio, groupPhoto: String
    let id: Int
    let name: String
    let participantCount: Int
    let groupPrivate: Bool
    let userStatus: String

    enum CodingKeys: String, CodingKey {
        case bio
        case groupPhoto = "group_photo"
        case id, name
        case participantCount = "participant_count"
        case groupPrivate = "private"
        case userStatus = "user_status"
    }
}
