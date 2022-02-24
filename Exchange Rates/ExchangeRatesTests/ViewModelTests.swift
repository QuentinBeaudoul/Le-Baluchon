//
//  ViewModelTests.swift
//  Exchange RatesTests
//
//  Created by Quentin on 22/02/2022.
//

import XCTest
@testable import ExchangeRates

class ViewModelTests: XCTestCase {

    let viewModel = ExchangeRatesViewModel(manager: StubManager())
    
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
    
    func testGivenNoRates_WhenReloadRates_ThenHasRates() {
        
        // When
        viewModel.reloadRates { _ in }
        
        // Then
        XCTAssertTrue(viewModel.hasExchangeRates() == true)
    }
    
    func testGivenNoRates_WhenReloadRates_ThenRatesUpdated() {
        
        // When
        viewModel.reloadRates { _ in }
        
        // Then
        let rate = viewModel.getUSDExchangeRate()
        XCTAssertTrue(rate == 5)
    }
    
    func testGivenSourceToConvert_WhenConverting_ThenSourceIsConvertedIntoTarget() {
        
        // Given
        viewModel.updateSource("10.5")
        
        // When
        viewModel.convert()
        
        // Then
        let result = viewModel.target
        XCTAssert(result == "52.5")
        
    }

}
