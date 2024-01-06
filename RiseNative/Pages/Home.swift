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
    @Environment(AppData.self) private var appData
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
        ScrollView(showsIndicators: false){
            VStack(spacing: 20){
                HStack{
                    VStack(alignment: .leading , spacing: 5){
                        Text("Good \(timeOfDay == .morning ? "Morning 🌦️": timeOfDay == .afternoon ? "Afternoon ☀️" : "Evening 🌃")").font(.custom("DMSans-Regular", size: 15))
                        Text("\(appData.profile?.firstName ?? "")").font(.custom("DMSans-Regular", size: 20))
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
                Button(action: {
                    currentTab = .wallet
                }, label: {
                    HStack{
                        Group{
                            Image(systemName: "plus")
                            Text("Add money")
                        }.font(.custom("DMSans-Bold", size: 15)).foregroundStyle(.black)
                    }.frame(maxWidth : .infinity).padding().background(
                        RoundedRectangle(cornerRadius: 5)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.44, green: 0.53, blue: 0.61).opacity(0.2), lineWidth: 1)
                        
                    )
                }
                       
                )
                
                HStack(alignment: .center) {
                    HStack{
                        Image("orangePadlock").resizable().scaledToFit().frame(width: 21 , height: 21)
                        Text("Complete your profile")
                          .font(Font.custom("TomatoGrotesk-Regular", size: 15))
                    }
                    Spacer()
                    Button(action: {
                        currentTab = .more
                    }, label: {
                        HStack(alignment: .center, spacing: 12) {
                            Text("View all").font(
                                Font.custom("DMSans-Medium", size: 13)
                                .weight(.medium)
                            ).foregroundStyle(.white) .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .background(Color(red: 1, green: 0.44, blue: 0.13))
                                .cornerRadius(20)
                            
                     Image("arrowLeft").resizable().scaledToFit().frame(width: 8 , height: 14)
                        }
                       
                    })
                  
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.riseTextSoft.opacity(0.1))
                .cornerRadius(12)
                
                CreatePlanView()
                CustomerCornerView()
                QuotesView().padding(.top , 10)
                Image("rise").renderingMode(.template).resizable().scaledToFit().frame(width: 80 , height: 24).foregroundStyle(Color.riseTextSoft.opacity(0.2))

            }.padding().onAppear(){
                getTimeOfDay()
            }
        }
    }
}

#Preview {
    Home(currentTab: .constant(.home))
}
