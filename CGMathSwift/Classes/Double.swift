//
//  Double.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(min: Double, max: Double, progress: Double) -> Double {
	return (1 - progress) * min + progress * max
}

public func inverseLerp(min: Double, max: Double, value: Double) -> Double {
	return (value - min) / (max - min)
}

extension Double {
	public func clamp(min: Double = 0, max: Double = 1) -> Double {
		return Swift.max(min, Swift.min(max, self))
	}
	
	public func remap(fromRange from: (start: Double, end: Double), toRange to: (start: Double, end: Double)) -> Double {
		let t = inverseLerp(min: from.start, max: from.end, value: self)
		return lerp(min: to.start, max: to.end, progress: t)
	}
}
