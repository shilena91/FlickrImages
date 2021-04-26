//
//  CategoriesDataSource+Tests.swift
//  FlickImagesTests
//
//  Created by Hoang Pham on 26.4.2021.
//

import XCTest
@testable import FlickImages

class CategoriesDataSource_Tests: XCTestCase {
    
    private var categoriesDataSource: CategoriesDataSource<CategoriesViewModel>?
    private var tableView: UITableView?

    override func setUp() {
        super.setUp()

        let categoriesVM = CategoriesViewModel()
        categoriesDataSource = CategoriesDataSource(categories: categoriesVM)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView?.dataSource = categoriesDataSource
    }

    
    override func tearDown() {
        categoriesDataSource = nil
        tableView = nil
        super.tearDown()
    }


    func testNumberOfRows() {
        XCTAssertEqual(categoriesDataSource?.tableView(tableView!, numberOfRowsInSection: 0), 4, "There should be 4 rows in table view")
    }
    
    
    func testTableViewCell() {
        tableView?.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseId)
        
        guard let _ = categoriesDataSource?.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? CategoryCell else {
            XCTAssert(false, "Expect tableview cell")
            return
        }
    }

    
    func testGetItem() {
        let item = categoriesDataSource?.categories.getItem(byPosition: 0)
        
        XCTAssertEqual(item!.title, "Animals")
    }
    
}
