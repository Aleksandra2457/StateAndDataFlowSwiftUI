//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var storageManager: StorageManager
    
    @State private var name = ""
    @State private var nameSymbolsCount = 0
    @State private var namesSymbolsLabelColor = Color.red
    @State private var okButtonIsDisabled = true
    
    var body: some View {
        VStack {
            HStack  {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        nameSymbolsCount = newValue.count
                        if newValue.count < 3 {
                            namesSymbolsLabelColor = .red
                        } else {
                            namesSymbolsLabelColor = .green
                            okButtonIsDisabled = false
                        }
                    }
                Text("\(nameSymbolsCount)")
                    .foregroundColor(namesSymbolsLabelColor)
                    .padding(.trailing, 10)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(okButtonIsDisabled)
            }
            
        }
    }
    
    private func registerUser() {
            userManager.name = name
            storageManager.name = userManager.name
            userManager.isRegistered.toggle()
            storageManager.isRegistered = userManager.isRegistered
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
