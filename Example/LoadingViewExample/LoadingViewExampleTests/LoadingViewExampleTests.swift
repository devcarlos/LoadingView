//
//  LoadingViewExampleTests.swift
//  LoadingViewExampleTests
//
//  Created by Carlos Alcala on 12/3/20.
//

import XCTest
@testable import LoadingViewExample

class LoadingViewExampleTests: XCTestCase {

    var taskDogs: TaskList<String>?
    var taskNumbers: TaskList<Int>?
    var taskData: TaskData?

    override func setUp() {

        taskDogs = TaskList<String>()

        guard let taskDogs = self.taskDogs else {
            XCTFail("Dog Tasks are invalid")
            return
        }

        taskDogs.append(value: "Labrador")
        taskDogs.append(value: "Bulldog")
        taskDogs.append(value: "Beagle")
        taskDogs.append(value: "Husky")

        print("DOGS \(taskDogs)")
        print(taskDogs)


        taskDogs.runTasks()
        let dogFailed = taskDogs.failed()
        print("FAILED DOGS \(dogFailed)")

        taskNumbers = TaskList<Int>()

        guard let numbers = self.taskNumbers else {
            XCTFail("Number Tasks are invalid")
            return
        }

        numbers.append(value: 5)
        numbers.append(value: 10)
        numbers.append(value: 15)

        print("NUMBERS \(numbers)")
        numbers.runTasks()
        let numbersFailed = numbers.failed()
        print("FAILED NUMS \(numbersFailed)")


        taskData = TaskData()
    }

    override func tearDown() {
        taskDogs = nil
        taskNumbers = nil
        taskData = nil
    }

    func testTasksCount() throws {
        guard let taskDogs = self.taskDogs else {
            XCTFail("Dog Tasks are invalid")
            return
        }

        guard let taskNumbers = self.taskNumbers else {
            XCTFail("Numbers Tasks are invalid")
            return
        }

        XCTAssertNotNil(self.taskDogs, "Tasks Dogs should be valid")
        XCTAssertEqual(taskDogs.description, "[Labrador, Bulldog, Beagle, Husky]", "Tasks should be equal")

        XCTAssertNotNil(self.taskNumbers, "Tasks Numbers should be valid")
        XCTAssertEqual(taskNumbers.description, "[5, 10, 15]", "Tasks should be equal")
    }


    func testTasksData() throws {
        guard let taskData = self.taskData else {
            XCTFail("Tasks Data is invalid")
            return
        }

        taskData.load()

        XCTAssertNotNil(self.taskData, "TasksData should be valid")
        XCTAssertEqual(taskData.values(), ["1","2","3","4","5","6","7","8","9","10"], "TasksData values should be equal")
        XCTAssertEqual(taskData.toString(), "1,2,3,4,5,6,7,8,9,10", "TasksData String should be equal")
    }
}
