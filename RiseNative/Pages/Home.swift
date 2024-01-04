//
//  Home.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import SwiftUI



enum Time {
    case morning
    case afternoon
    case evening
}



struct Home: View {

    @State var timeOfDay : Time = .morning
    @Binding var currentTab:Tabs
    func getTimeOfDay() {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        
        switch hour {
        case 0..<12:
            timeOfDay =  .morning
        case 12..<17:
            timeOfDay = .afternoon
        default:
            timeOfDay = .evening
        }
        
    }
        
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack(alignment: .leading , spacing: 5){
                        Text("Good \(timeOfDay == .morning ? "Morning 🌦️": timeOfDay == .afternoon ? "Afternoon ☀️" : "Evening 🌃")").font(.custom("DMSans-Regular", size: 15))
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
                    BalanceCardView(currentTab: $currentTab)
                }.frame(height: 220)
                Spacer()
            }.padding().onAppear(){
                getTimeOfDay()
            }
        }
    }
}

#Preview {
    Home(currentTab: .constant(.home))
}
