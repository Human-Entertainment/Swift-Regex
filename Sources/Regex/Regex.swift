struct Regex: ExpressibleByStringLiteral {
    
	/// This is the pattern you're going to want to match
    init(stringLiteral value: String) {
        self.pattern = value
    }
    
    private let pattern: String
   
    public var description: String {
        return pattern
    }

    /**
	Matches the given pattern with `toMatch`

    - Parameter toMatch: The string we should match

    - Throws: If no match is given, or if the pattern is poorly formattet

    - Returns: The first match, if you wish to match more, use `match(toMatch: String, mode: RegexMode) -> String`
    */
    public func match(toMatch: String) throws -> String {
    	guard let match = match(toMatch: toMatch, mode: .first).first else { throw RegexError.noMatch }
    	return match
    }


    // TODO: Make this!
    /**
	Matches the given pattern with `toMatch`

	- Parameter toMatch: The string we should match
	- Parameter mode: The mode at which the function should operate at

	- Returns: All the matches (in accordance to mode)
    */
    public func match(toMatch: String, mode: RegexMode) -> [String] {
    	[toMatch]
    }


    enum RegexMode {
    	case first
    	case all
    }

    enum RegexError: Error {
    	/// There where no match
    	case noMatch
    	/// The pattern to be matched is written wrongly
    	case badFormat
    }
}

extension Regex: CustomStringConvertible {}

extension Regex: Equatable {}