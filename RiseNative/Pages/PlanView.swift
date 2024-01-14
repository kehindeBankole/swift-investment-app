//
//  PlanView.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import SwiftUI

enum PlanTabs : String , CaseIterable{
    case plans = "Plans"
    case portfolio = "Portfolio"
}

struct PlanView: View {
    @State private var currentTab = PlanTabs.plans
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 18.5) {
                Text("Plans")
                    .font(
                        .custom("TomatoGrotesk-Regular", size: 24)
                        .weight(.bold)
                    ).multilineTextAlignment(.leading)
                    .foregroundStyle(.black).padding()
                
                GeometryReader{ proxy in
                    let width = proxy.size.width
                    let height = proxy.size.height
                    HStack{
                        ForEach(PlanTabs.allCases , id :\.rawValue){item in
                            Spacer()
                            VStack{
                                Button(action: {
                                    if(currentTab == .plans){
                                        currentTab = .portfolio
                                    }else{
                                        currentTab = .plans
                                    }
                                }){
                                    Text(item.rawValue)
                                        .font(
                                            Font.custom("DMSans-Bold", size: 17)
                                        )
                                        .frame(maxWidth : .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(item.rawValue == currentTab.rawValue ? Color.riseTeal : Color.riseTextSoft)
                               
                                }
                               }
                            Spacer()
                        }
                    }.background(
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 42, height: 2.17559)
                            .background(Color.riseTeal)
                            .cornerRadius(9)
                            .offset(x: currentTab == .plans ? -(width / 4)  : width / 4 , y : height - 12 )
                            .animation(.default, value: currentTab == .plans)
                        
                    )
                }.frame(height: 40)
                
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 0)
            .background(.white)
            .shadow(color: Color(red: 0.21, green: 0.28, blue: 0.35).opacity(0.15), radius: 10, x: 0, y: 2)
            
            
            TabView(selection: $currentTab){
                Text("plan").tag(PlanTabs.plans)
                Text("portfolio").tag(PlanTabs.portfolio)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    PlanView()
}
