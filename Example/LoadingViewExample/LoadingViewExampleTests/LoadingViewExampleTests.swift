//
//  LoadingViewExampleTests.swift
//  LoadingViewExampleTests
//
//  Created by Carlos Alcala on 12/3/20.
//

import XCTest
@testable import LoadingViewExample

class LoadingViewExampleTests: XCTestCase {

    var tasks: [Task]?

    override func setUp() {
        tasks = [
            Task(0),
            Task(1).then(Task(2)).then(Task(3)),
            Task(4).then(Task(5))
        ]
    }

    override func tearDown() {
        tasks = nil
    }

    func testTasksCount() throws {
        guard let tasks = self.tasks else {
            XCTFail("Tasks are invalid")
            return
        }

        XCTAssertNotNil(self.tasks, "Tasks should be valid")
        XCTAssertEqual(tasks.count, 3, "Tasks should be 3")
    }
}
