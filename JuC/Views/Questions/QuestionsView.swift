//
//  QuestionsView.swift
//  JuC
//
//  Created by Mike on 3/25/23.
//

import SwiftUI

struct QuestionsView: View {
    @StateObject var viewModel = QuestionsViewModel()
    @Binding var showTextfield: Bool
    @Binding var chatSheetPosition: SheetPositionWithDismiss
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(viewModel.questionsQue, id: \.id) { question in
                    NavigationLink(destination: QuestionView(question: question)
                        .onAppear(){
                            chatSheetPosition = .dissMissed
                            showTextfield.toggle()
                        }
                        .onDisappear() {
                            chatSheetPosition = .dissMissed
                            showTextfield.toggle()
                        })
                    {
                        QuestionLabel(question: question)
                    }
                    .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(showTextfield: .constant(true), chatSheetPosition: .constant(.dissMissed))
    }
}
