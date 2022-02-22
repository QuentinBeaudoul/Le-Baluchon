//
//  ViewModelTests.swift
//  Exchange RatesTests
//
//  Created by Quentin on 22/02/2022.
//

import XCTest
@testable import ExchangeRates

class ViewModelTests: XCTestCase {

    let viewModel = ExchangeRatesViewModel()
    
    func testGivenSource_WhenUpdateSource_ThenSourceIsUpdated() {
        
        // When
        viewModel.updateSource("12.5")
        
        // Then
        XCTAssertTrue(viewModel.source == "12.5")
    }
    
    func testClear() {
        // Given
        viewModel.updateSource("20")
        
        // When
        viewModel.convert()
        viewModel.clear()
        // Then
        XCTAssertTrue(viewModel.source == "" && viewModel.target == "")
    }

}
