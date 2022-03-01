//
//  TranslateTests.swift
//  TranslateTests
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import XCTest
@testable import Translate

class ViewModelTests: XCTestCase {

    let viewModel = TranslateViewModel(manager: TranslateManager(manager: StubNetworkManager()))
    
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

    func testGivenNoLangs_WhenFetchingLanguages_ThenHasLanguages() {

        // When
        viewModel.manager.fetchLanguages { result in
            // Then
            switch result {
            case .success(let container):
                XCTAssertNotNil(container)
            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
    }

    func testGivenLangsFetched_WhenWantToGetSourceLangs_ThenGettingSourceLangs() {

        // Given

        viewModel.manager.fetchLanguages {[self] result in
            switch result {
            case .success(_):

                // When
                let sourceLangs = viewModel.getSourceLangs()
                let expectedResult = ["De", "Fr", "Es", "En"]
                var res = true

                expectedResult.forEach { lang in
                    if !sourceLangs.contains(lang) {
                        res = false
                    }
                }

                // Then
                XCTAssertTrue(res)

            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
    }

    func testGivenLangsFetched_WhenWantToGetTargetLangsForSource_ThenGettingTargetLangs() {
        // Given

        viewModel.manager.fetchLanguages {[self] result in
            switch result {
            case .success(_):

                // When
                let source = "En"

                let result = viewModel.getTargetLangs(for: source)
                let expectedResult = ["De", "Es", "Fr"]
                // Then
                XCTAssertEqual(result, expectedResult)

            case .failure(let error):
                XCTAssertThrowsError(error)
            }
        }
    }

    func testGivenLiteralName_WhenGettingSubName_ThenHasSubName() {

        // Given
        let literalName = "Français"

        // When
        let result = viewModel.manager.getNameFromLiteral(for: literalName)

        // Then
        XCTAssertEqual(result, "Fr")
    }

    func testGivenName_WhenGettingLiteralName_ThenHasLiteralName() {

        // Given
        let name = "Fr"

        // When
        let result = viewModel.manager.getLiteralName(for: name)

        // Then
        XCTAssertEqual(result, "Français")
    }

}
