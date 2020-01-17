struct Regex: ExpressibleByStringLiteral {
    
	/// This is the pattern you're going to want to match
    init(stringLiteral value: String) {
        self.pattern = value
    }
    
    private let pattern: String
   
    public var description: String {
        return pattern
    }
}

extension Regex: CustomStringConvertible {}