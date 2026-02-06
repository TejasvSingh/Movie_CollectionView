//
//  Movie_CollectionViewTests1.swift
//  Movie_CollectionViewTests1
//
//  Created by Tejasv Singh on 2/5/26.
//

import XCTest
@testable import Movie_CollectionView
final class Movie_CollectionViewTests1: XCTestCase {
    var objCalculator: Calculator?

    override func setUpWithError() throws {
        objCalculator = Calculator()
    }

    override func tearDownWithError() throws {
        objCalculator = nil
    }
    func testSum(){
        let sumValue = objCalculator?.sum(10, 20)
        XCTAssertEqual(sumValue, 30)
        let sumValue1 = objCalculator?.sum(nil, nil)
        XCTAssertEqual(sumValue1, 0)
    }
    func testSubtraction(){
        let subtractionValue = objCalculator?.sub(a: 10, b: 20)
        XCTAssertEqual(subtractionValue, -10)
        let subtractionValue1 = objCalculator?.sub(a: nil, b: nil)
        XCTAssertEqual(subtractionValue1, 0)
    }
    func testMultiplication(){
        let multiplicationValue = objCalculator?.multiply(a: 10, b: 20)
        XCTAssertEqual(multiplicationValue, 200)
        let multiplicationValue1 = objCalculator?.multiply(a: nil, b: nil)
        XCTAssertEqual(multiplicationValue1, 0)
    }
    func testDivision(){
        let divisionValue = objCalculator?.divide(a: 10, b: 2)
        XCTAssertEqual(divisionValue, 5)
        let divisionValue1 = objCalculator?.divide(a: 10, b: 0)
        XCTAssertEqual(divisionValue1, 0)
        let divisionValue2 = objCalculator?.divide(a: nil, b: nil)
        XCTAssertEqual(divisionValue2, 0)
        let divisionValue3 = objCalculator?.divide(a: 4, b: nil)
        XCTAssertEqual(divisionValue3, 0)
        let divisionValue4 = objCalculator?.divide(a: nil, b: 4)
        XCTAssertEqual(divisionValue4, 0)
        let divisionValue5 = objCalculator?.divide(a: nil, b: 0)
        XCTAssertEqual(divisionValue5, 0)
    }
}
