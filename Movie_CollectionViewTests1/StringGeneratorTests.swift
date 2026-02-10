//
//  StringGeneratorTests.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/6/26.
//

import XCTest
@testable import Movie_CollectionView
final class color_CollectionUITests: XCTestCase {
    var objStringGenerator: StringGenerator?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        objStringGenerator = StringGenerator()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        objStringGenerator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFizz(){
        let answer = objStringGenerator?.generateString(12)
        XCTAssertEqual(answer,"Fizz")
    }
    
    func testBuzz(){
        let answer = objStringGenerator?.generateString(50)
        XCTAssertEqual(answer,"Buzz")
    }
    
    func testFizzBuzz(){
        let answer = objStringGenerator?.generateString(15)
        XCTAssertEqual(answer,"FizzBuzz")
    }
    
    func testDefault(){
        let answer = objStringGenerator?.generateString(7)
        XCTAssertEqual(answer,"7")
    }
    
    func testZero(){
        let answer = objStringGenerator?.generateString(0)
        XCTAssertEqual(answer,"0")
    }
    
    func testNegativeThree(){
        let answer = objStringGenerator?.generateString(-3)
        XCTAssertEqual(answer,"-3")
    }
    func testNegativeFive(){
        let answer = objStringGenerator?.generateString(-5)
        XCTAssertEqual(answer,"-5")
    }
}
