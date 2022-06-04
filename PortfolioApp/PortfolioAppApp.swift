//
//  PortfolioAppApp.swift
//  PortfolioApp
//
//  Created by Mateusz Kuznik on 17/05/2022.
//

import SwiftUI

@main
struct PortfolioAppApp: App {

    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)

    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(
                    NotificationCenter.default.publisher(
                        for: UIApplication.willResignActiveNotification
                    ),
                    perform: save)
        }
    }

    func save(_ not: Notification) {
        dataController.save()
    }
}
