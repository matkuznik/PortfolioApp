//
//  AwardTests.swift
//  PortfolioAppTests
//
//  Created by Mateusz Kuznik on 17/06/2022.
//

import CoreData
import XCTest
@testable import PortfolioApp

class AwardTests: BaseTestCase {

    let awards = Award.allAwards

    func testAwardIDMatchesName() {
        for award in awards {
            XCTAssertEqual(award.id, award.name, "Award ID should always match its name.")
        }
    }

    func testNoAwards() throws {
        for award in awards {
            XCTAssertFalse(dataController.hasEarned(award: award), "New users should have no earned awards")
        }
    }

    func testItemAwards() throws {
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]

        for (count, value) in values.enumerated() {
            let items = createItems(numberOfItems: value)
            let matches = earnedAwards()

            XCTAssertEqual(matches.count, count + 1, "Adding \(value) items should unlock \(count + 1) awards.")

            delete(items)
        }
    }

    func testCompletedAwards() throws {
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]

        for (count, value) in values.enumerated() {
            let items = createItems(numberOfItems: value, completed: true)
            let matches = completedAwards()

            XCTAssertEqual(matches.count, count + 1, "Completing \(value) items should unlock \(count + 1) awards.")

            delete(items)
        }
    }

    private func createItems(
        numberOfItems: Int,
        completed: Bool = false) -> [Item] {

        (0..<numberOfItems).map { _ in
            let item = Item(context: managedObjectContext)
            item.completed = completed
            return item
        }
    }

    private func delete(_ items: [Item]) {
        for item in items {
            dataController.delete(item)
        }
    }

    private func earnedAwards() -> [Award] {
        awards.filter { award in
            award.criterion == "items" && dataController.hasEarned(award: award)
        }
    }

    private func completedAwards() -> [Award] {
        awards.filter { award in
            award.criterion == "complete" && dataController.hasEarned(award: award)
        }
    }
}
