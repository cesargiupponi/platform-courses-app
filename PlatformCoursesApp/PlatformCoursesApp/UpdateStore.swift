//
//  UpdateStore.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 31/05/25.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
