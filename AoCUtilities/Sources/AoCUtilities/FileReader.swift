import Foundation

public enum FileReader {
    public static func readLines(from fileURL: URL) throws -> [String] {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        return content
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
}
