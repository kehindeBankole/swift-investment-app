//
//  OnboardingView.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

struct OnboardingData : Hashable {
    let title:String
    let subtitle:String
}

let onboardContent = [OnboardingData(title: "Investments that help you grow", subtitle: "Personalized investment plans handpicked by experts to beat inflation and grow your wealth.") , OnboardingData(title: "Diversified Portfolio", subtitle: "Spread your investments across multiple asset classes.") , OnboardingData(title: "Managed For You", subtitle: "Get quality investment management, hassle free, handled for you.") , OnboardingData(title: "Get Additional Benefits", subtitle: "Dedicated multi-currency bank accounts, virtual cards, interest paying wallets and lots more.")]

struct OnboardingView: View {
    @AppStorage("isNewUser") var isNewUser: Bool = true
    @State var currentView = onboardContent[0]
    //using index for smooth animation purpose
    @State private var currentIndex = 0
    @State private var button1 = ButtonType.primary
    @State private var path:[String] = []
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                
                Image("onboarding-\(currentIndex)").resizable()
                
                    .edgesIgnoringSafeArea(.all).id(currentIndex)
                
                
                VStack{
                    TabView(selection: $currentView,
                            content:  {
                        ForEach(onboardContent, id:\.self, content: { item in
                            VStack(){
                                HStack{
                                    VStack(alignment: .leading , spacing: 8){
                                        Text(item.title).font(.custom("TomatoGrotesk-Medium", size: 24))
                                        Text(item.subtitle).font(.custom("TomatoGrotesk-Regular", size: 15))
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }.tag(item)
                        })
                        
                    }).tabViewStyle(PageTabViewStyle()).onChange(of: currentView) { old , new in
                        
                        if let index = onboardContent.firstIndex(where: { $0.title == currentView.title }) {
                            withAnimation{
                                currentIndex = index
                            }
                        }
                    }
                    
                    HStack(spacing: 8){
                        
                      
                            NavigationLink(destination: LoginView(), label: {
                                Text("Sign in").font(.custom("DMSans-Bold", size: 15)).foregroundStyle(Color.riseTeal).padding().padding(.horizontal, 20).background(Capsule().fill(Color.white.opacity(0.3)).cornerRadius(40).shadow(color: Color(red: 0.03, green: 0.6, blue: 0.63).opacity(0.25), radius: 8, x: 0, y: 0))                }).simultaneousGesture(TapGesture().onEnded {
                                   isNewUser = false

                                })
                       
                        Spacer()
                        
                        HStack{
                            NavigationLink(destination: SignupView(), label: {
                                Text("Create an account").frame(maxWidth:.infinity).font(.custom("DMSans-Bold", size: 15)).foregroundStyle(.white).padding().background(Capsule().fill(Color.riseTeal).cornerRadius(40))
                            })
                        }.frame(maxWidth: .infinity)
                        
                    }
          
                }.padding().padding(.top , 60).padding(.bottom , 80)
                
                
            }
            
        }
    }
}

#Preview {
    OnboardingView()
}
