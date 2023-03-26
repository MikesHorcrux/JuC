import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 45
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let minHeightRatio: CGFloat = 0.3
    static let midHeightRatio: CGFloat = 0.5
}

enum SheetPosition {
    case minimized, middle, maximized
}

struct BottomSheetView<Content: View>: View {
    @Binding var sheetPosition: SheetPosition

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let midHeight: CGFloat
    let content: Content

    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        switch sheetPosition {
        case .minimized:
            return maxHeight - minHeight
        case .middle:
            return maxHeight - midHeight
        case .maximized:
            return 0
        }
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.secondary)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            switch sheetPosition {
            case .minimized:
                sheetPosition = .middle
            case .middle:
                sheetPosition = .maximized
            case .maximized:
                sheetPosition = .middle
            }
#if !os(macOS)
            dismissKeyboard(true)
            #endif
        }
    }

    init(sheetPosition: Binding<SheetPosition>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.midHeight = maxHeight * Constants.midHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._sheetPosition = sheetPosition
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color("RichBlack").opacity(0.8))
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let minHeightThreshold = self.minHeight * 0.5
                    let midHeightThreshold = self.midHeight * 0.5
#if !os(macOS)
                    dismissKeyboard(true)
                    #endif
                    if value.translation.height > 0 {
                        if abs(value.translation.height) > minHeightThreshold {
                            self.sheetPosition = .minimized
                        } else if abs(value.translation.height) > midHeightThreshold {
                            self.sheetPosition = .middle
                        } else {
                            self.sheetPosition = .maximized
                        }
                    } else {
                        if abs(value.translation.height) > minHeightThreshold {
                            self.sheetPosition = .maximized
                        } else if abs(value.translation.height) > midHeightThreshold {
                            self.sheetPosition = .middle
                        } else {
                            self.sheetPosition = .minimized
                        }
                    }
                }
            )
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(sheetPosition: .constant(.minimized), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
