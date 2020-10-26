//
//  UserResponse.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import Foundation

class UserResponse: BaseResponse {
    var login: String?
    var id: Int?
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var url, htmlURL, followersURL: String?
    var followingURL, gistsURL, starredURL: String?
    var subscriptionsURL, organizationsURL, reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
       var siteAdmin: Bool?
    private enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        try super.init(from: decoder)
        do {
            login = try container.decodeIfPresent(String.self, forKey: .login)
            id = try container.decodeIfPresent(Int.self, forKey: .id)
            nodeID = try container.decodeIfPresent(String.self, forKey: .nodeID)
            avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL)
            gravatarID = try container.decodeIfPresent(String.self, forKey: .gravatarID)
            url = try container.decodeIfPresent(String.self, forKey: .url)
            htmlURL = try container.decodeIfPresent(String.self, forKey: .htmlURL)
            followersURL = try container.decodeIfPresent(String.self, forKey: .login)
            followingURL = try container.decodeIfPresent(String.self, forKey: .followingURL)
            gistsURL = try container.decodeIfPresent(String.self, forKey: .gistsURL)
            starredURL = try container.decodeIfPresent(String.self, forKey: .starredURL)
            subscriptionsURL = try container.decodeIfPresent(String.self, forKey: .subscriptionsURL)
            reposURL = try container.decodeIfPresent(String.self, forKey: .reposURL)
            eventsURL = try container.decodeIfPresent(String.self, forKey: .eventsURL)
            receivedEventsURL = try container.decodeIfPresent(String.self, forKey: .receivedEventsURL)
            type = try container.decodeIfPresent(String.self, forKey: .type)
            siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
        } catch {

        }

    }
    
}

