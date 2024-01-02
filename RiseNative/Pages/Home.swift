//
//  Home.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import SwiftUI

struct Home: View {

    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading , spacing: 5){
                    Text("Good morning ☀️").font(.custom("DMSans-Regular", size: 15))
                    Text("Deborah").font(.custom("DMSans-Regular", size: 20))
                }
                Spacer()
                ZStack{
                  
                    Image("bell").resizable().renderingMode(.template).scaledToFit().frame(width: 40 , height: 40)
                    Text("99+").font(.custom("TomatoGrotesk-SemiBold", size: 10)).foregroundStyle(.white).background(Circle().fill(.red).frame(width: 25 , height: 25)).offset(x:15 , y:-15)
                }
              
            }
            VStack{
                CampaignCardView()
            }.frame(height: 192)
            VStack{
                BalanceCardView()
            }.frame(height: 220)
            Spacer()
        }.padding()
    }
}

#Preview {
    Home()
}
