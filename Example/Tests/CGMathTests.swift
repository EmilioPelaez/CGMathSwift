// https://github.com/Quick/Quick

import Quick
import Nimble
import CGMathSwift

class CGMathSpec: QuickSpec {
	override func spec() {
		describe("CGMath") {
			let start: CGFloat = 5
			let end: CGFloat = 10
			let middle: CGFloat = (start + end) / 2
			
			it("Clamp") {
				expect(clamp(value: start - 1, min: start, max: end)) == start
				expect(clamp(value: start, min: start, max: end)) == start
				expect(clamp(value: middle, min: start, max: end)) == middle
				expect(clamp(value: end, min: start, max: end)) == end
				expect(clamp(value: end + 1, min: start, max: end)) == end
			}
		}
	}
}
