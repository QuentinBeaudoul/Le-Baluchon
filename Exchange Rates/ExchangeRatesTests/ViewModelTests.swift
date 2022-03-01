//
//  ViewModelTests.swift
//  Exchange RatesTests
//
//  Created by Quentin on 22/02/2022.
//

import XCTest
@testable import ExchangeRates

class ViewModelTests: XCTestCase {

    let viewModel = ExchangeRatesViewModel(manager: ExchangeRatesManager(manager: StubNetworkManager()))
    
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
        viewModel.reloadRates {[self] _ in
            // Then
            XCTAssertTrue(viewModel.hasExchangeRates() == true)
        }

    }
    
    func testGivenNoRates_WhenReloadRates_ThenRatesUpdated() {
        
        // When
        viewModel.reloadRates { _ in }
        
        // Then
        let rate = viewModel.getUSDExchangeRate()
        XCTAssertTrue(rate == 1.116757)
    }
    
    func testGivenSourceToConvert_WhenConverting_ThenSourceIsConvertedIntoTarget() {
        
        // Given
        viewModel.updateSource("10.5")
        viewModel.reloadRates {[self] result in
            switch result {
            case .success():
                // When
                viewModel.convert()

                // Then
                let result = viewModel.target
                XCTAssertEqual(result, "11.7259485")
            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
    }

}
