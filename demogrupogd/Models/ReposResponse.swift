//
//  ReposResponse.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/26/20.
//

import Foundation
class ReposResponse : BaseResponse {
    var id: Int?
    var nodeID, name, fullName: String?
    var htmlURL: String?
    var reposResponseDescription: String?
    var url, forksURL: String?
    var keysURL, collaboratorsURL: String?
    var teamsURL, hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var language: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case htmlURL = "html_url"
        case reposResponseDescription = "description"
        case url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case language
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        try super.init(from: decoder)
        do {
            id = try container.decodeIfPresent(Int.self, forKey: .id)
            nodeID = try container.decodeIfPresent(String.self, forKey: .nodeID)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
            url = try container.decodeIfPresent(String.self, forKey: .url)
            htmlURL = try container.decodeIfPresent(String.self, forKey: .htmlURL)
            reposResponseDescription = try container.decodeIfPresent(String.self, forKey: .reposResponseDescription)
            forksURL = try container.decodeIfPresent(String.self, forKey: .forksURL)
            keysURL = try container.decodeIfPresent(String.self, forKey: .keysURL)
            collaboratorsURL = try container.decodeIfPresent(String.self, forKey: .collaboratorsURL)
            teamsURL = try container.decodeIfPresent(String.self, forKey: .teamsURL)
            hooksURL = try container.decodeIfPresent(String.self, forKey: .hooksURL)
            eventsURL = try container.decodeIfPresent(String.self, forKey: .eventsURL)
            issueEventsURL = try container.decodeIfPresent(String.self, forKey: .issueEventsURL)
            eventsURL = try container.decodeIfPresent(String.self, forKey: .eventsURL)
            language = try container.decodeIfPresent(String.self, forKey: .language)
        } catch {

        }

    }
}
