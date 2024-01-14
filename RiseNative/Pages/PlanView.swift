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
                
                HStack{
                    ForEach(PlanTabs.allCases , id :\.rawValue){item in
                        Spacer()
                        VStack{
                            Text(item.rawValue)
                                .font(
                                    Font.custom("DMSans-Bold", size: 17)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundStyle(item.rawValue == currentTab.rawValue ? Color.riseTeal : Color.riseTextSoft)

                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 42, height: 2.17559)
                                  .background(Color.riseTeal)
                                  .cornerRadius(9)
                                  .opacity(item.rawValue == currentTab.rawValue ? 1.0 : 0.0)
                                  .animation(.default, value: item.rawValue == currentTab.rawValue)
                        }
                        Spacer()
                    }
                }
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
