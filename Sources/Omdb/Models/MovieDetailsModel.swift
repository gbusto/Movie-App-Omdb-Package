//
//  MovieDetailsModel.swift
//  
//
//  Created by Gabriel Busto on 12/14/22.
//

import Foundation

public struct Rating: Decodable {
    public var Source: String
    public var Value: String
}

public struct MovieDetailsResult: Decodable {
    public var Actors: String?
    public var Awards: String?
    public var BoxOffice: String?
    public var Country: String?
    public var DVD: String?
    public var Director: String?
    public var Genre: String?
    public var Language: String?
    public var Metascore: String
    public var Plot: String
    public var Poster: String
    public var Production: String?
    public var Rated: String?
    public var Ratings: [Rating]?
    public var Released: String?
    public var Response: String?
    public var Runtime: String?
    public var Title: String
    public var `Type`: String?
    public var Website: String?
    public var Writer: String?
    public var Year: String?
    public var imdbID: String
    public var imdbRating: String?
    public var imdbVotes: String?
}
