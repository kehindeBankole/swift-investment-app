//
//  BalanceCardView.swift
//  RiseNative
//
//  Created by kehinde on 02/01/2024.
//

import SwiftUI

struct BalanceCardView: View {
    @State var currentView = 1
    var body: some View {
        VStack{
            
            TabView(selection: $currentView,
                    content:  {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 192)
                    .foregroundColor(.white)
                    .shadow(color: Color.riseTextSoft.opacity(0.2), radius: 5, x: 0, y: 10)
                    .padding(1).overlay(content: {
                        VStack{
                            Text("content")
                        }
                    }).tag(1)
                
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 192)
                    .foregroundColor(.white)
                    .shadow(color: Color.riseTextSoft.opacity(0.2), radius: 5, x: 0, y: 10)
                    .padding(1).overlay(content: {
                        VStack{
                            Text("content")
                        }
                    }).tag(2)
                
            }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).cornerRadius(20)
            HStack{
                ForEach( 0 ..< 2 , id:\.self){index  in
                    let isActive = index == currentView - 1
                    Rectangle().fill(isActive ? Color.riseActiveCard : Color.textSoft).opacity(isActive ? 1 : 0.2).frame(width: index == currentView-1 ? 12 : 5 , height: 5).cornerRadius(20).animation(.default, value: isActive)
                }
            }
        }
    }
}

#Preview {
//    BalanceCardView()
    Home()
}
