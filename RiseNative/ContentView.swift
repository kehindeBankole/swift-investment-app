//
//  ContentView.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isNewUser") var isNewUser = true
    var body: some View {
        VStack {
 
            if(isNewUser == true){
                OnboardingView()
            }else{
                LoginView()
            }
        }.preferredColorScheme(.light)
   
    }
}

#Preview {
    ContentView()
}
