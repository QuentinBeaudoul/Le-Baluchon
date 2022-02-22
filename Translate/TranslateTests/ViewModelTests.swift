//
//  TranslateTests.swift
//  TranslateTests
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import XCTest
@testable import Translate

class ViewModelTests: XCTestCase {

    let viewModel = TranslateViewModel()
    
    func testGivenSourceAndTarget_WhenSwappingValues_ThenValuesAreSwapped() {
        
        // Given
        viewModel.setSource(with: "Français")
        viewModel.setTarget(with: "English")
        
        // When
        viewModel.swapSourceTraget(safeTarget: viewModel.target ?? "")
        
        // Then
        XCTAssertTrue(viewModel.source == "English" && viewModel.target == "Français")
    }
    
    func testGivenNewSource_WhenSettingSource_ThenSourceIsSet() {
        // When
        viewModel.setSource(with: "Español")
        
        // Then
        XCTAssertTrue(viewModel.source == "Español")
    }
    
    func testGivenNewtarget_WhenSettingTarget_ThenTargetIsSet() {
        // When
        viewModel.setTarget(with: "Français")
        
        // Then
        XCTAssertTrue(viewModel.target == "Français")
    }

}
