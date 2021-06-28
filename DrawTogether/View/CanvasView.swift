/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view that draws the strokes of the canvas and responds to user input.
*/

import SwiftUI

struct CanvasView: View {
    @ObservedObject var canvas: Canvas

    var body: some View {
        GeometryReader { _ in
            ForEach(canvas.strokes) { stroke in
                StrokeView(stroke: stroke)
            }
            if let activeStroke = canvas.activeStroke {
                StrokeView(stroke: activeStroke)
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
        .gesture(strokeGesture)
    }

    var strokeGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                canvas.addPointToActiveStroke(value.location)
            }
            .onEnded { value in
                canvas.addPointToActiveStroke(value.location)
                canvas.finishStroke()
            }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(canvas: Canvas())
            .previewLayout(.sizeThatFits)
    }
}
