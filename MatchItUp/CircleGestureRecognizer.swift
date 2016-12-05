//
//  CircleGestureRecognizer.swift
//  MatchItUp
//
//  Created by Robin Somlette on 4-Dec-2016.
//  Copyright © 2016 raywenderlich. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class CircleGestureRecognizer: UIGestureRecognizer {

	private var touchedPoints = [CGPoint]() // points history
	private(set) var fitResult = CircleResult()
	private(set) var tolerance: CGFloat = 0.2
	private(set) var isCircle = false

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesBegan(touches, with: event)
		if touches.count != 1 { state = .failed }
		state = .began
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesEnded(touches, with: event)

		fitResult = fitCircle(touchedPoints)
		isCircle = fitResult.error <= tolerance
		state = isCircle ? .ended : .failed

		state = .ended
	}

	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesMoved(touches, with: event)

		// 1
		guard state != .failed else { return }

		// 2
		let window = view?.window
		if let loc = touches.first?.location(in: window) {
			// 3
			touchedPoints.append(loc)
			// 4
			state = .changed
		}
	}
}
