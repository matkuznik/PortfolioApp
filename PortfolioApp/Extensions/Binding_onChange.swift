//
//  Bnding_onChange.swift
//  PortfolioApp
//
//  Created by Mateusz Kuznik on 21/05/2022.
//

import Foundation
import SwiftUI

extension Binding {

    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
