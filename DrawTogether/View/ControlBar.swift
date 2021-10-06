/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that contains the buttons used to interact with the canvas or app.
*/

import SwiftUI
import GroupActivities

struct ControlBar: View {
    @ObservedObject var canvas: Canvas
    @StateObject var groupStateObserver = GroupStateObserver()

    var body: some View {
        HStack {
            if canvas.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                Button {
                    canvas.startSharing()
                } label: {
                    Image(systemName: "person.2.fill")
                }
                .buttonStyle(.borderedProminent)
            }

            Spacer()

            Button {
                canvas.reset()
            } label: {
                Image(systemName: "trash.fill")
            }
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
    }
}

struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(canvas: Canvas())
            .previewLayout(.sizeThatFits)
    }
}
