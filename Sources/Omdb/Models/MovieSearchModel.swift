//
//  MovieSearchModel.swift
//  
//
//  Created by Gabriel Busto on 12/14/22.
//

import Foundation

public struct MovieSearchRoot: Decodable {
    public var Search: [MovieSearchResult]?
}

public struct MovieSearchResult: Identifiable, Decodable {
    public var id: String {imdbID}
    
    public var Poster: String
    public var Title: String
    public var `Type`: String
    public var Year: String
    public var imdbID: String
}
