//
//  CircleGestureRecognizer.swift
//  MatchItUp
//
//  Created by Robin Somlette on 4-Dec-2016.
//  Copyright © 2016 raywenderlich. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class CircleGestureRecognizer: UIGestureRecognizer {

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesBegan(touches, with: event)
		state = .began
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
		super.touchesEnded(touches, with: event)
		state = .ended
	}
}
