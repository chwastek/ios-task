import XCTest

class CampaignBrowserUITests: XCTestCase {

    var application: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
    }

    func test_viewContainsCell_withCorrectTitleAndDescription() {
        // Given
        let firstTitle = "Kreative Wandideen"
        let firstDescription = "Wir machen uns viele Gedanken, wenn es ums die Wahl der M\u{00f6}bel oder die passende Deko geht. Doch auch eine pers\u{00f6}nlich gestaltete Wand kann ein eindrucksvolles Wohn-Statement sein. Denn es gibt viele M\u{00f6}glichkeiten, sich auszutoben. Von praktischen Bilderleisten, die schnelle Ver\u{00e4}nderungen erlauben, \u{00fc}ber Memoboards bis zu leuchtenden Schriftz\u{00fc}gen \u{2013} diese kreativen Ideen machen Lust aufs Gestalten."
        
        // When
        application.launch()
        let cellTitles = application.staticTexts["title"]
        let cellDescriptions = application.staticTexts["description"]
        
        XCTAssertTrue(cellTitles.firstMatch.waitForExistence(timeout: 1.0))
        XCTAssertTrue(cellDescriptions.firstMatch.exists)
        
        XCTAssertEqual(cellTitles.firstMatch.label, firstTitle)
        XCTAssertEqual(cellDescriptions.firstMatch.label, firstDescription)
    }

}
