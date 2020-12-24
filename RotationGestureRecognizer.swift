//
//  RotationGestureRecognizer.swift
//  KnobControl
//
//  Created by anand on 24/12/20.
//

import Foundation

import UIKit.UIGestureRecognizerSubclass

public class RotationGestureRecognizer: UIPanGestureRecognizer {
  public var touchAngle: CGFloat = 0

  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesBegan(touches, with: event)
    updateAngle(with: touches)
  }

  public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesMoved(touches, with: event)
    updateAngle(with: touches)
  }

  public func updateAngle(with touches: Set<UITouch>) {
    guard let touch = touches.first, let view = view else {
      return
    }
    let touchPoint = touch.location(in: view)
    touchAngle = angle(for: touchPoint, in: view)
  }

  public func angle(for point: CGPoint, in view: UIView) -> CGFloat {
    let centerOffset = CGPoint(x: point.x - view.bounds.midX, y: point.y - view.bounds.midY)
    return atan2(centerOffset.y, centerOffset.x)
  }

  override init(target: Any?, action: Selector?) {
    super.init(target: target, action: action)

    maximumNumberOfTouches = 1
    minimumNumberOfTouches = 1
  }
}
