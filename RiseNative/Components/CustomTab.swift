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

extension Image {
    func ImageModifier() -> some View{
        self.resizable().scaledToFit()
    }
}
struct CustomTab: View {
    @Binding var currentTab:Tabs
    @State private var profilePicUrl = ""
    
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
                            AsyncImage(url: URL(string: profilePicUrl), content: { image in
                                image.ImageModifier().frame(width: 40 , height:40).cornerRadius(100)
                            }, placeholder: {
                                Image(systemName: "person.circle").ImageModifier().frame(width: 40 , height:40).foregroundStyle(Color.riseIconColor)
                            }).id(profilePicUrl)
                        }
                        if(isCurrentTab == true){
                            Circle().fill(.black).frame(width: 7 , height: 7)
                        }else{
                            
                            Text(item.rawValue).font(.custom("DMSans-Medium", size: 12)).foregroundStyle(Color.textSoft)
                        }
                        
                    }
                    Spacer()
                })
                
            })
        }.padding(.horizontal , 20).task(priority: .high) {
            do{
                let data : Profile? =   try await makeApiCall(endpoint: baseUrl + "/auth/profile", method: .get)
                if let pictureUrl = data!.profilePicUrl {
                    profilePicUrl = pictureUrl
                }
            
            }catch {
                print(error)
            }
        }
    }
}

#Preview {
    CustomTab(currentTab: .constant(.home))
}
