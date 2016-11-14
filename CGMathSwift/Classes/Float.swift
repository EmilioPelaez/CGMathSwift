//
//  Float.swift
//  Pods
//
//  Created by Emilio Peláez on 11/10/16.
//
//

import Foundation

public func lerp(start: Float, end: Float, progress: Float) -> Float {
	return (1 - progress) * start + progress * end
}

public func inverseLerp(start: Float, end: Float, value: Float) -> Float {
	return (value - start) / (end - start)
}

extension Float {
	public func clamp(min: Float = 0, max: Float = 1) -> Float {
		return CGMathSwift.clamp(value: self, min: min, max: max)
	}
	
	public func remap(fromRange from: (start: Float, end: Float), toRange to: (start: Float, end: Float)) -> Float {
		let t = inverseLerp(start: from.start, end: from.end, value: self)
		return lerp(start: to.start, end: to.end, progress: t)
	}
}
