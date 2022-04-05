//
//  DogsAppsTests.swift
//  DogsAppsTests
//
//  Created by Abhishek babladi on 2022-03-30.
//

import XCTest
@testable import DogsApps

class DogsAppsTests: XCTestCase {
    
    var viewControllerUnderTest: DogsCollectionViewController!
    
//    let mockData = DogCellViewModel(name: "rottiwiler", id: 1, url: "skdkdkk.com", temperament: "nil", lifeSpan: "nil", bredFor: "nil")
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

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest =   storyboard.instantiateViewController(identifier: "DogsCollectionViewController") as? DogsCollectionViewController
        viewControllerUnderTest.viewDidLoad()
        viewControllerUnderTest.loadView()
        viewControllerUnderTest.initViewModel()
        viewControllerUnderTest.initView()
    }
    
    func testHasCollectionView(){
        XCTAssertNotNil(self.viewControllerUnderTest.collectionView)
    }
    
    func testHasCollectionViewDelegate(){
        XCTAssertNotNil(self.viewControllerUnderTest.collectionView?.delegate)
    }
    
    func testSuiteHasCollectionViewDataSource(){
        XCTAssertNotNil(self.viewControllerUnderTest.collectionView?.dataSource)
    }
    
    func testTableViewConformstoDataSourceProtocol(){
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UICollectionViewDelegate.self))
       
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.collectionView(_:didSelectItemAt:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.collectionView(_:cellForItemAt:))))
    }
    
    func testCollectionViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.collectionView(viewControllerUnderTest.collectionView.unsafelyUnwrapped, cellForItemAt: IndexPath(row: 0, section: 1)) as? DogCollectionViewCell
        let actualReuseIdentifier = cell?.reuseIdentifier
        let expectedIdentifier = "cell"
        XCTAssertEqual(actualReuseIdentifier, expectedIdentifier)
    }
    
}
