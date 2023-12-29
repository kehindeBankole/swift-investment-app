//
//  ContentView.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isNewUser") var isNewUser = true
    var appData = ApiData()
    
    var body: some View {
            VStack {
              
                if(isNewUser == true){
                    OnboardingView()
                }else{
                    if(appData.isAuthenticated == false){
                        LoginView()
                    }else{
                        LayoutView()
                    }
                }
            }.preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
