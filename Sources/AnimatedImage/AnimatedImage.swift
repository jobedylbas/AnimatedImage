//
//  AnimatedImage.swift
//  AnimatedImages
//
//  Created by Jobe Diego Dylbas dos Santos on 22/04/20.
//  
//

import SwiftUI

/// An AnimatedImage is an implementation that given sequence of images it will play like a video

@available (iOS 13.0, OSX 10.15, *)
public struct AnimatedImage: View {
    
    // MARK: - Properties
    @State private var image: Image?
    
    private let imagesNames: [String]
    private let templateImageName: String?
    private let interval: Double
    private let loop: Bool
    private let loopIndex: Int
    private let iterations: Int
    
    /// Create a AnimatedImage
    /// - Parameters:
    ///     - imagesNames: An Array of images names that will be shown.
    ///     - templateImageName: Name of the first image. If not provided, the default value will be used.
    ///     - interval: Time that each image will still shown.
    ///     - loop: Boolean that determines if the video will play on loop. If not provided, the default value false will be used.
    ///     - loopIndex: Where the video restarts when on loop. If not provided, the default value 0 will be used.
    ///     - iterations: If the video loops, how many times it will loop. For infinite loop just not use this parameter. If not provided, the default value infinite will be used.
    public init(_ images: [String],
                templateImageName: String? = nil,
                interval: Double,
                loop: Bool = false,
                loopIndex: Int = 0,
                iterations: Int = Int.max) {
        self.imagesNames = images
        self.templateImageName = templateImageName
        self.interval = interval
        self.loop = loop
        self.loopIndex = loopIndex
        self.iterations = iterations
    }
    
    public var body: some View {
        Group {
            image?
                .resizable()
                .scaledToFit()
        }.onAppear(perform: {
            self.animate()
        })
    }
    
    
    /// Create a video sensation
    ///
    /// Use this method to iterate through the images to look like a video
    private func animate() {
        var imageIndex: Int = 0
        var iterations: Int = 1
        var idle: Bool = false
        
        Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true) { timer in
            if imageIndex < self.imagesNames.count {
                self.image = Image(self.imagesNames[imageIndex])
                imageIndex += 1
                
                if imageIndex == self.imagesNames.count && self.loop && iterations != self.iterations {
                    imageIndex = self.loopIndex

                    if self.iterations != Int.max {
                        iterations += 1
                    }
                    
                    if !idle {
                        idle = true
                    }
                }
            }
            if !self.loop && idle && iterations == self.iterations {
                timer.invalidate()
            }
        }
    }
}
