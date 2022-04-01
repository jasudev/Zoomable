//
//  ZoomableImageView.swift
//  
//
//  Created by jasu on 2022/01/27.
//  Copyright (c) 2022 jasu All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import SwiftUI
import SDWebImageSwiftUI

public struct ZoomableImageView<Content>: View where Content: View {
    
    private var url: URL
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    private var showsIndicators: Bool = false
    @Binding var scale: CGFloat
    @ViewBuilder private var overlay: () -> Content
    
    @State private var imageSize: CGSize = .zero
    
    /**
     Initializes an `ZoomableImageView`
     - parameter url : The image url.
     - parameter min : The minimum value that can be zoom out.
     - parameter max : The maximum value that can be zoom in.
     - parameter showsIndicators : A value that indicates whether the scroll view displays the scrollable component of the content offset, in a way that’s suitable for the platform.
     - parameter overlay : The ZoomableImageView view’s overlay.
     */
    public init(url: URL,
                min: CGFloat = 1.0,
                max: CGFloat = 3.0,
                showsIndicators: Bool = false,
                scale: Binding<CGFloat>,
                @ViewBuilder overlay: @escaping () -> Content) {
        self.url = url
        self.min = min
        self.max = max
        self.showsIndicators = showsIndicators
        self._scale = scale
        self.overlay = overlay
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZoomableView(size: imageSize, min: self.min, max: self.max, showsIndicators: self.showsIndicators, scale: self.scale) {
                WebImage(url: url)
                    .resizable()
                    .onSuccess(perform: { image, _, _ in
                        DispatchQueue.main.async {
                            self.imageSize = CGSize(width: proxy.size.width, height: proxy.size.width * (image.size.height / image.size.width))
                        }
                    })
                    .indicator(.activity)
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .overlay(self.overlay())
            }
        }
    }
}
