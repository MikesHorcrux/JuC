//
//  BottomSheetWithDismissView.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 45
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let minHeightRatio: CGFloat = 0.3
    static let midHeightRatio: CGFloat = 0.5
    static let disaperedHeightRatio: CGFloat = -0.1
}

enum SheetPositionWithDismiss {
    case maximized, dissMissed
}

struct BottomSheetWithDismissView<Content: View>: View {
    @Binding var sheetPosition: SheetPositionWithDismiss

    let maxHeight: CGFloat
    let dissMissedHeight: CGFloat
    let content: Content

    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        switch sheetPosition {
        case .maximized:
            return 0
        case .dissMissed:
            return maxHeight - dissMissedHeight
        }
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color("RichBlack"))
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
            )
    }

    init(sheetPosition: Binding<SheetPositionWithDismiss>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.maxHeight = maxHeight
        self.dissMissedHeight = maxHeight * Constants.disaperedHeightRatio
        self.content = content()
        self._sheetPosition = sheetPosition
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    self.indicator.padding()
                    self.content
                }
                .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
                .background(Color("BottomSheet"))
                .cornerRadius(Constants.radius)
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: max(self.offset + self.translation, 0))
                .animation(.interactiveSpring())
                .gesture(
                    DragGesture().updating(self.$translation) { value, state, _ in
                        state = value.translation.height
                    }.onEnded { value in
                        if value.translation.height > 0 {
                            self.sheetPosition = .dissMissed
                        } else {
                            self.sheetPosition = .maximized
                        }
                    }
                )
            }
        }
    }
}

struct BottomSheetWithDismissView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetWithDismissView(sheetPosition: .constant(.maximized), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
