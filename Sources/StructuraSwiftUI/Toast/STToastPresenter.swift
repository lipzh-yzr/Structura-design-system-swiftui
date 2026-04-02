//
//  STToastPresenter.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/1.
//

import Observation
import SwiftUI

@MainActor
@Observable
public final class STToastPresenter {
    public private(set) var currentToast: STToastItem?

    @ObservationIgnored
    private var queue: [STToastItem] = []

    public init() {}

    public func show(_ toast: STToastItem) {
        guard currentToast?.id != toast.id else {
            return
        }

        if currentToast == nil {
            currentToast = toast
        } else {
            queue.append(toast)
        }
    }

    public func dismissCurrent() {
        currentToast = queue.isEmpty ? nil : queue.removeFirst()
    }

    public func dismiss(id: UUID) {
        if currentToast?.id == id {
            dismissCurrent()
            return
        }

        queue.removeAll { $0.id == id }
    }

    public func clear() {
        currentToast = nil
        queue.removeAll()
    }
}
