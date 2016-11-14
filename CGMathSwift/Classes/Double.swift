//
//  Double.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: Double, end: Double, progress: Double) -> Double {
	return (1 - progress) * start + progress * end
}

public func inverseLerp(start: Double, end: Double, value: Double) -> Double {
	return (value - start) / (end - start)
}

extension Double {
	public func clamp(min: Double = 0, max: Double = 1) -> Double {
		return CGMathSwift.clamp(value: self, min: min, max: max)
	}
	
	public func remap(fromRange from: (start: Double, end: Double), toRange to: (start: Double, end: Double)) -> Double {
		let t = inverseLerp(start: from.start, end: from.end, value: self)
		return lerp(start: to.start, end: to.end, progress: t)
	}
}
