//
//  CreatePlanView.swift
//  RiseNative
//
//  Created by kehinde on 06/01/2024.
//

import SwiftUI

struct CreatePlanView: View {
    @Environment(AppData.self) private var appData
    
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Text("Create a plan")
                    .font(Font.custom("TomatoGrotesk-Regular", size: 18))
                    .foregroundColor(.black)
                Spacer()
                HStack{
                    Text("View all plans")
                        .font(
                            Font.custom("DMSans-Regular", size: 15)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.trailing)
                        .foregroundStyle(Color(red: 0.58, green: 0.63, blue: 0.68))
                    
                    Image("arrowLeft").resizable().scaledToFit().frame(width: 4 , height: 9)
                }
            }
            .frame(maxWidth: .infinity)
            
            Text("Start your investment journey by creating a plan\"")
                .font(Font.custom("DMSans-Regular", size: 15))
                .foregroundStyle(Color.riseTextSoft)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.vertical , 8)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing:20){
                    ZStack {
                        VStack{
                            Image(systemName: "plus").foregroundColor(Color.riseTeal)
                                .frame(width: 42.63994, height: 42.63994)
                                .background(.white)
                                .cornerRadius(100)
                            
                            Text("Create an investment plan")
                                .font(
                                    Font.custom("DMSans-Bold", size: 14)
                                    
                                )
                                .multilineTextAlignment(.center).padding(.top , 2)
                            
                        }
                    }
                    .padding()
                    .frame(width: 188, height: 243)
                    .background(Color(red: 0.44, green: 0.53, blue: 0.61).opacity(0.1))
                    .cornerRadius(12)
                    
                    
                    
                    if(appData.plan != nil){
                        ForEach(Array(appData.plan!.data.enumerated()) , id:\.element.name){ index , plan in
                            
                            ZStack(alignment: .bottomLeading) {
                                VStack{
                                    AsyncImage(url: URL(string: "\(planImages[plan.planType] ?? "")"), content: { img in
                                        img.resizable().scaledToFill()
                                    }, placeholder: {
                                        
                                    })
                                }.frame(width: 188, height: 243)
                                
                                HStack{
                                    VStack(alignment: .leading){
                                     
                                        Text(plan.name)
                                            .font(Font.custom("DMSans-Regular", size: 15))
                                            .foregroundColor(.white)
                                        
                                        Text(getFormattedCurrency(value: plan.totalDeposited))
                                            .font(Font.custom("TomatoGrotesk-Regular", size: 18))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "arrow.forward").foregroundStyle(.white)
                                }.padding()
                            }
                            .padding()
                            .frame(width: 188, height: 243)
                            .background(Color(red: 0.44, green: 0.53, blue: 0.61).opacity(0.1))
                            .cornerRadius(12)
                            
                        }
                    }
                }
            }
            )
            
     
            
        }.task {
            do{
                
                let data : PlanModel? = try await makeApiCall(endpoint: baseUrl + "/user-plans", method: .get)
                if let plansData = data{
                    appData.plan = plansData
                }
                
            }catch{
                print(error)
            }
        }
    }
}

#Preview {
    CreatePlanView()
}
