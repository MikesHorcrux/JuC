//
//  MainView.swift
//  JuC
//
//  Created by Mike on 3/19/23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var jucManager: JuCManager
    @Binding var showTextfield: Bool
    @Binding var chatSheetPosition: SheetPositionWithDismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                PromptsList(jucManager: jucManager)
                HStack {
                    Text("Revolutionizing Professional Communication with AI Expertise")
                        .foregroundColor(Color("YinMinBlue"))
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
                .padding(.bottom, 20)
                QuestionsView(showTextfield: $showTextfield, chatSheetPosition: $chatSheetPosition)
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("JuC")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                AccountView()
                                    .onAppear(){
                                        chatSheetPosition = .dissMissed
                                        showTextfield.toggle()
                                    }
                                    .onDisappear() {
                                        chatSheetPosition = .maximized
                                        showTextfield.toggle()
                                    }
                            } label: {
                                UserLabel()
                            }
                            
                            
                        }
                    }
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(jucManager: JuCManager(client: InMemoryAPIClient()), showTextfield: .constant(false), chatSheetPosition: .constant(.dissMissed))
    }
}
#endif
