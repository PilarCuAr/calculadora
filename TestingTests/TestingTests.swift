//
//  TestingTests.swift
//  TestingTests
//
//  Created by MAC on 02/09/22.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /* func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }*/
    
    func testSum() throws {
      XCTAssert(sum(2, 4) == 6)
      XCTAssert(sum(3, 0) == 3)
      XCTAssert(sum(-3, 0) == -3)
    }
    
    func testMovie() throws {
     
      // 1
      let bundle = Bundle(for: type(of: self))
     
      guard let url = bundle.url(forResource: "data", withExtension: "json") else {
          //Creado mal el data.json
        XCTFail("Missing file: data.json")
        return
      }
     
      let json = try Data(contentsOf: url)
      let decoder = JSONDecoder()
     
      // 2
      let movie = try decoder.decode(Movie.self, from: json)
     
      XCTAssertNotNil(movie)
      XCTAssertEqual(movie.name, "Titanic")
     
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yy"
      let date = dateFormatter.date(from: "12/19/1997")
      XCTAssertEqual(movie.releaseDate, date)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
