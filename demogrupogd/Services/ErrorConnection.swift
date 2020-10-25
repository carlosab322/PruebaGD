//
//  ErrorConnection.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

enum ErrorConnection: Int {
    case unknown = -1
    case cancelled = -999
    case badURL = -1000
    case timedOut = -1001
    case unsupportedURL = -1002
    case cannotFindHost = -1003
    case cannotConnectToHost = -1004
    case connectionLost = -1005
    case lookupFailed = -1006
    case HTTPTooManyRedirects = -1007
    case resourceUnavailable = -1008
    case notConnectedToInternet = -1009
    case redirectToNonExistentLocation = -1010
    case badServerResponse = -1011
    case userCancelledAuthentication = -1012
    case userAuthenticationRequired = -1013
    case zeroByteResource = -1014
    case cannotDecodeRawData = -1015
    case cannotDecodeContentData = -1016
    case cannotParseResponse = -1017
    case fileDoesNotExist = -1100
    case fileIsDirectory = -1101
    case noPermissionsToReadFile = -1102

    case secureConnectionFailed = -1200
    case serverCertificateHasBadDate = -1201
    case serverCertificateUntrusted = -1202
    case serverCertificateHasUnknownRoot = -1203
    case serverCertificateNotYetValid = -1204
    case clientCertificateRejected = -1205
    case clientCertificateRequired = -1206
    case cannotLoadFromNetwork = -2000

    case cannotCreateFile = -3000
    case cannotOpenFile = -3001
    case cannotCloseFile = -3002
    case cannotWriteToFile = -3003
    case cannotRemoveFile = -3004
    case cannotMoveFile = -3005
    case downloadDecodingFailedMidStream = -3006
    case downloadDecodingFailedToComplete = -3007

}
