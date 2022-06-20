//
//  BaseTestCase.swift
//  BaseTestCase
//
//  Created by Mateusz Kuznik on 17/06/2022.
//

import CoreData
import XCTest
@testable import PortfolioApp

class BaseTestCase: XCTestCase {

    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
