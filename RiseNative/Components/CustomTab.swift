//
//  CustomTab.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import SwiftUI

enum Tabs : String , CaseIterable  {
    case home = "Home"
    case plans = "Plans"
    case wallet = "Wallet"
    case feed = "Feed"
    case more = "More"
}

struct CustomTab: View {
    @Binding var currentTab:Tabs
    @Environment(AppData.self) private var appData
    
    var body: some View {
        Divider()
        HStack(alignment: .center){
            ForEach(Tabs.allCases , id:\.rawValue ,  content: {item in
                let isCurrentTab = item.rawValue == currentTab.rawValue
                Spacer()
                Button(action: {
                    currentTab = item
                }, label: {
                    VStack(alignment: .center){
                        if(item != .more){
                            Image(item.rawValue).resizable().renderingMode(.template).foregroundStyle(isCurrentTab == true ? .black : Color.riseIconColor).scaledToFit().frame(width: 40 , height:40)
                        }else{
                            AsyncImage(url: URL(string: appData.profile?.profilePicUrl ?? "sjd"), content: { image in
                                image.ImageModifier().frame(width: 40 , height:40).cornerRadius(100)
                            }, placeholder: {
                                Image(systemName: "person.circle").ImageModifier().frame(width: 40 , height:40).foregroundStyle(Color.riseIconColor)
                            }).id(appData.profile?.profilePicUrl ?? "sd")
                        }
                        if(isCurrentTab == true){
                            Circle().fill(.black).frame(width: 7 , height: 7)
                        }else{
                            
                            Text(item.rawValue).font(.custom("DMSans-Medium", size: 12)).foregroundStyle(Color.textSoft)
                        }
                        
                    }
                    Spacer()
                }).disabled(isCurrentTab)
                
            })
        }.padding(.horizontal , 20)
            .task(priority: .high) {
                
                do{
                    let data : Profile? = try await makeApiCall(endpoint: baseUrl + "/auth/profile", method: .get)
                    
                    if let profile = data {
                        appData.profile = profile
                    }
                    
                    
                } catch {
                    
                    switch error {
                       
                    case MyError.UnAuthorized:
                        
                        print("Unauthorized error occurred:", error)
                    default:
                        print("Other error:", error)
                    }
                }
            }
        
    }
}

#Preview {
    CustomTab(currentTab: .constant(.home))
}
