//
//  Task.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import Foundation

enum TaskStatus: Int {
    case fail = 0
    case success = 1
}

public class Task<T> {
    var value: T
    var status: TaskStatus = .fail

    var next: Task<T>?
    weak var previous: Task<T>?

    init(value: T) {
        self.value = value
    }

    func runTask() {
        let value = Int.random(in: 0...1)
        self.status = TaskStatus(rawValue: value) ?? .fail
    }
}

extension Task: CustomStringConvertible {
    public var description: String {
        "\(value)"
    }
}

public class TaskList<T> {
    fileprivate var head: Task<T>?
    private var tail: Task<T>?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Task<T>? {
        return head
    }

    public var last: Task<T>? {
        return tail
    }

    public func append(value: T) {
        let newNode = Task(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    public func nodeAt(index: Int) -> Task<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }

    public func removeAll() {
        head = nil
        tail = nil
    }

    public func remove(node: Task<T>) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }

    public func runTasks() {
        var node = head
        while node != nil {
            node?.runTask()
            node = node!.next
        }
    }
}

extension TaskList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

extension TaskList {
    public func failed() -> TaskList<T> {
        let failed = TaskList<T>()
        var node = head
        while node != nil {
            guard let task = node else {
                continue
            }

            if node?.status == .fail {
                failed.append(value: task.value)
            }
            node = node!.next
        }
        return failed
    }
}


//
//let dogBreeds = TaskList<String>()
//dogBreeds.append(value: "Labrador")
//dogBreeds.append(value: "Bulldog")
//dogBreeds.append(value: "Beagle")
//dogBreeds.append(value: "Husky")
//
//print("DOGS \(dogBreeds)")
//print(dogBreeds)
//dogBreeds.runTasks()
//let dogFailed = dogBreeds.failed()
//print("FAILED DOGS \(dogFailed)")
//
//let numbers = TaskList<Int>()
//numbers.append(value: 5)
//numbers.append(value: 10)
//numbers.append(value: 15)
//
//print("NUMBERS \(numbers)")
//numbers.runTasks()
//let numbersFailed = numbers.failed()
//print("FAILED NUMS \(numbersFailed)")
