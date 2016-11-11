//
//  CGFloat.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(min: CGFloat, max: CGFloat, progress: CGFloat) -> CGFloat {
	return (1 - progress) * min + progress * max
}

public func inverseLerp(min: CGFloat, max: CGFloat, value: CGFloat) -> CGFloat {
	return (value - min) / (max - min)
}

extension CGFloat {
	public func clamp(min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
		return Swift.max(min, Swift.min(max, self))
	}
	
	public func remap(fromRange from: (start: CGFloat, end: CGFloat), toRange to: (start: CGFloat, end: CGFloat)) -> CGFloat {
		let t = inverseLerp(min: from.start, max: from.end, value: self)
		return lerp(min: to.start, max: to.end, progress: t)
	}
}
