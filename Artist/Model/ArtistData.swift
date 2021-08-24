//
//  ArtistData.swift
//  Artist
//
//  Created by gayatri patel on 8/21/21.
//


import Foundation

// MARK: - ArtistData
struct ArtistData: Codable {
    let resultCount: Int
    let results: [ArtistResult]
}

// MARK: - Result
struct ArtistResult: Codable {
    
    let artistName: String
    let trackName: String
    let releaseDate: String
    let currency: String
    let primaryGenreName: String
    let trackPrice: Double
    
}











