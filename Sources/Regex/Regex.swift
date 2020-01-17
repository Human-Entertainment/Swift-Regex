public struct Regex: ExpressibleByStringLiteral {
    
	/// This is the pattern you're going to want to match
    public init(stringLiteral value: String) {
        self.pattern = value
    }
    
    private let pattern: String
   
    public var description: String {
        return pattern
    }

    // MARK: Match functions

    /**
	Matches the given pattern with `toMatch`

    - Parameter toMatch: The string we should match

    - Throws: If no match is given, or if the pattern is poorly formattet

    - Returns: The first match, if you wish to match more, use `match(toMatch: String, mode: RegexMode) -> String`
    */
    public func match(toMatch: String) throws -> String {
    	guard let match =  try match(toMatch: toMatch, mode: .first).first else { throw RegexError.noMatch }
    	return match
    }

    /**
	Matches the given pattern with `toMatch`

	- Parameter toMatch: The string we should match
	- Parameter mode: The mode at which the function should operate at

	- Throws: If no match is given, or if the pattern is poorly formattet

	- Returns: All the matches (in accordance to mode)
    */
    public func match(toMatch: String, mode: RegexMode) throws -> [String] {
    	if doesMatch(toMatch: toMatch) {
	    	var collection: [String] = []

	    	// For mode = .first
	    	var matches = 0
	    	for character in toMatch {
                // TODO: This matches anthing as long as it contains the given character
                if pattern.contains(character) {
                    collection.append(pattern)
                    matches += 1
                }
	    		if mode == .first && matches > 0 {
	    			break
	    		}
	    	}

	    	return collection
    	} else {
    		throw RegexError.noMatch
    	}
    }

    /**
    */
    public func doesMatch(toMatch: String) -> Bool {
    	return toMatch.map{ pattern.contains($0) }.contains(true)
    }

    public enum RegexMode {
    	case first
    	case all
    }

    public enum RegexError: Error {
    	/// There where no match
    	case noMatch
    	/// The pattern to be matched is written wrongly
    	case badFormat
    }
}

extension Regex: CustomStringConvertible {}

extension Regex: Equatable {}