//
//  ScrollCloseBottomMixin.swift
//  Mixin
//
//  Created by one on 30/11/2017.
//  Copyright © 2017 one. All rights reserved.
//

import UIKit

public protocol ScrollCloseBottomMixin: ScrollViewMixinable {
    var scrollCloseBottomThreshold: CGFloat { get }
    func closeBottom()
    var scrollViewDelegate: UIScrollViewDelegate? { get }
}

public extension ScrollCloseBottomMixin {
    private func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.scrollOver(offset: scrollCloseBottomThreshold) {
            closeBottom()
        }
    }
    public var scrollViewDelegate: UIScrollViewDelegate? {
        return BlockUIScrollViewDelegate(scrollViewDidScroll: scrollViewDidScroll)
    }
}
