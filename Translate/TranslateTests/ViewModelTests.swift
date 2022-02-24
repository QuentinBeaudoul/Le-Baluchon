//
//  TranslateTests.swift
//  TranslateTests
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import XCTest
@testable import Translate

class ViewModelTests: XCTestCase {

    let viewModel = TranslateViewModel(manager: StubManager())
    
    override func setUp() {
        super.setUp()
        
        // Given
        viewModel.setSource(with: "Fr")
        viewModel.setTarget(with: "En")
    }
    
    func testGivenSourceAndTarget_WhenSwappingValues_ThenValuesAreSwapped() {
        
        // When
        viewModel.swapSourceTraget(safeTarget: viewModel.target ?? "")
        
        // Then
        XCTAssertTrue(viewModel.source == "En" && viewModel.target == "Fr")
    }
    
    func testGivenNewSource_WhenSettingSource_ThenSourceIsSet() {
        // When
        viewModel.setSource(with: "Es")
        
        // Then
        XCTAssertTrue(viewModel.source == "Es")
    }
    
    func testGivenNewtarget_WhenSettingTarget_ThenTargetIsSet() {
        // When
        viewModel.setTarget(with: "Fr")
        
        // Then
        XCTAssertTrue(viewModel.target == "Fr")
    }
    
    func testGivenTextInSourceLang_WhenTranslating_ThenTextIsTranslated() {
        
        let text = "hello"
        
        // When
        viewModel.processTranslation(text: text) { result in
            switch result {
                
            case .success(let translatedText):
                // Then
                XCTAssert(translatedText == "Bonjour")
            case .failure(_):
                break
            }
        }
    }

}
