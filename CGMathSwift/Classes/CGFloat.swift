//
//  CGFloat.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: CGFloat, end: CGFloat, progress: CGFloat) -> CGFloat {
	return (1 - progress) * start + progress * end
}

public func inverseLerp(start: CGFloat, end: CGFloat, value: CGFloat) -> CGFloat {
	return (value - start) / (end - start)
}

public extension CGFloat {
	public func clamp(min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
		return CGMathSwift.clamp(value: self, min: min, max: max)
	}
	
	public func remap(fromRange from: (start: CGFloat, end: CGFloat), toRange to: (start: CGFloat, end: CGFloat)) -> CGFloat {
		let t = inverseLerp(start: from.start, end: from.end, value: self)
		return lerp(start: to.start, end: to.end, progress: t)
	}
}
