//
//  BeadFastAppHomeScreen_UIKit_UITestsLaunchTests.swift
//  BeadFastAppHomeScreen(UIKit)UITests
//
//  Created by Mina Dawood on 10/09/2024.
//

import XCTest

final class BeadFastAppHomeScreen_UIKit_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
