//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Александра Лесовская on 19.05.2022.
//

import SwiftUI

class StorageManager: ObservableObject {
    
    @AppStorage("name") var name = ""
    @AppStorage("isRegistered") var isRegistered = false
    
}
