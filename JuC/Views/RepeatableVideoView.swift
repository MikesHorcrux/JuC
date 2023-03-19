//
//  RepeatableVideoView.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct RepeatingPlayer: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<RepeatingPlayer>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let fileUrl = Bundle.main.url(forResource: "the-camera-moves-slowly-around-the-arm-of-the-robot-the-hand-opens-the-fingers-has--SBV-333869886-HD", withExtension: "mov")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer()
        player.isMuted = true
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
