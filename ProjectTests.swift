//
//  ProjectTests.swift
//  PortfolioAppTests
//
//  Created by Mateusz Kuznik on 17/06/2022.
//

import CoreData
import XCTest
@testable import PortfolioApp

class ProjectTests: BaseTestCase {

    func testCreatingProjectsAndItems() {
        let targetCount = 10

        createProjectsWithItems(countOfProjects: targetCount, countOfItemsImEachProject: targetCount)

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), targetCount)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), targetCount * targetCount)
    }

    func testDeletingProjectCascadeDeletesItems() throws {

        let projects = createProjectsWithItems(countOfProjects: 5, countOfItemsImEachProject: 10)

        dataController.delete(projects[0])

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 4)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 40)
    }

    @discardableResult
    private func createProjectsWithItems(countOfProjects: Int = 10, countOfItemsImEachProject: Int = 10) -> [Project] {
        (0..<countOfProjects).map { _ -> Project in
            let project = Project(context: managedObjectContext)

            for _ in 0..<countOfItemsImEachProject {
                let item = Item(context: managedObjectContext)
                item.project = project
            }
            return project
        }
    }
}
