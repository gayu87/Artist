//
//  ArtistAPIManagerTests.swift
//  ArtistTests
//
//  Created by gayatri patel on 8/23/21.
//

import XCTest
@testable import Artist

class ArtistAPIManagerTests: XCTestCase {
    
         
        var model:ArtistAPIManager?
       var artiatInfo = [ArtistResult]()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model?.getData(for: "bill") { info in
            switch info {
            case .success(let artistData):
                XCTAssertNotNil(artistData)
                self.artiatInfo = artistData.results
            case .failure(let error):
                XCTAssertNil(error)
            }
           
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       model = nil
    }
    
    func testNumberOfArtistCount(){
        
        model?.getData(for: "bill") { info in
            switch info {
            case .success(let artistData):
                XCTAssertNotNil(artistData)
                XCTAssertEqual(50, artistData.resultCount)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }

}
