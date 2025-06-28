//
//  ADKWebView.swift
//  Alto
//
//  Created by StudioMovieGirl
//

import AppKit
import WebKit

// MARK: - ADKWebView

/// Custom verson of WKWebView to avoid needing an extra class for management
@Observable
public class ADKWebView: WKWebView, webViewProtocol {
    public var ownerTab: ADKWebPage?
    public var currentConfiguration: WKWebViewConfiguration
    public var delegate: WKUIDelegate?
    public var navDelegate: WKNavigationDelegate?

    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        currentConfiguration = configuration
        super.init(frame: frame, configuration: configuration)

        allowsMagnification = true
        customUserAgent =
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15"
        isInspectable = true

        // Notify that a new WebView was created so AdBlock can be set up
        NotificationCenter.default.post(
            name: NSNotification.Name("AltoWebViewCreated"),
            object: self
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    deinit {}

    public override func mouseDown(with theEvent: NSEvent) {
        super.mouseDown(with: theEvent)
        ownerTab?.handleMouseDown()
    }
}

extension WKWebView {
    /// WKWebView's `configuration` is marked with @NSCopying.
    /// So everytime you try to access it, it creates a copy of it, which is most likely not what we want.
    var configurationWithoutMakingCopy: WKWebViewConfiguration {
        (self as? ADKWebView)?.currentConfiguration ?? configuration
    }
}

public protocol webViewProtocol: WKWebView {
    var currentConfiguration: WKWebViewConfiguration { get set }
    var delegate: WKUIDelegate? { get set }
    var navDelegate: WKNavigationDelegate? { get set }
}
