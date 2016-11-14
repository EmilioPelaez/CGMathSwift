//
//  DoubleTests.swift
//  CGMathSwift
//
//  Created by Emilio Peláez on 11/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import CGMathSwift

class DoubleSpec: QuickSpec {
	override func spec() {
		describe("Double") {
			let start: Double = 5
			let end: Double = 10
			let middle: Double = (start + end) / 2
			
			let progressStart: Double = 0
			let progressEnd: Double = 1
			let progressMiddle: Double = (progressStart + progressEnd) / 2
			
			it("lerp") {
				expect(lerp(min: start, max: end, progress: progressStart)) == start
				expect(lerp(min: start, max: end, progress: progressMiddle)) == middle
				expect(lerp(min: start, max: end, progress: progressEnd)) == end
			}
			
			it("inverseLerp") {
				expect(inverseLerp(min: start, max: end, value: start)) == progressStart
				expect(inverseLerp(min: start, max: end, value: middle)) == progressMiddle
				expect(inverseLerp(min: start, max: end, value: end)) == progressEnd
			}
			
			it("remap") {
				expect(start.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressStart
				expect(middle.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressMiddle
				expect(end.remap(fromRange: (start, end), toRange: (progressStart, progressEnd))) == progressEnd
			}
		}
	}
}
