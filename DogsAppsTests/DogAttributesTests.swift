//
//  DogAttributesTests.swift
//  DogsAppsTests
//
//  Created by Abhishek babladi on 2022-04-04.
//

import XCTest
@testable import DogsApps

class DogAttributesTests: XCTestCase {

    private var viewControllerUnderTest:DogAttributesTableViewController!
    
    override func setUp() {
          super.setUp()
          
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "DogAttributesTableViewController") as? DogAttributesTableViewController
          self.viewControllerUnderTest.loadView()
          self.viewControllerUnderTest.viewDidLoad()
      }
      
      override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
          super.tearDown()
      }
      
      func testHasATableView() {
          XCTAssertNotNil(viewControllerUnderTest.tableView)
      }
      
      func testTableViewHasDelegate() {
          XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
      }
      
      func testTableViewConfromsToTableViewDelegateProtocol() {
          XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
      }
      
      func testTableViewHasDataSource() {
          XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
      }
      
      func testTableViewConformsToTableViewDataSourceProtocol() {
          XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
          XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.numberOfSections(in:))))
          XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
          XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
      }
    


      func testTableViewCellHasReuseIdentifier() {
          let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? AttributesTableViewCell
          let actualReuseIdentifer = cell?.reuseIdentifier
          let expectedReuseIdentifier = "Cell"
          XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
      }

      func testTableCellHasCorrectLabelText() {
          let cell0 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: [35]) as? AttributesTableViewCell
          XCTAssertEqual(cell0?.bredForLabel.text, "one")
          
          let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: [0,4]) as? AttributesTableViewCell
          XCTAssertEqual(cell1?.lifeSpanLabel.text, "two")
          
          let cell2 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: [0,5]) as? AttributesTableViewCell
          XCTAssertEqual(cell2?.tempramentLabel.text, "three")
      }
     
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
