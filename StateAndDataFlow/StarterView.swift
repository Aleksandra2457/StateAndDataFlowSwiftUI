//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var storageManager: StorageManager
    
    var body: some View {
        Group {
            if storageManager.isRegistered {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
            .environmentObject(StorageManager())
    }
}
