// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Forks
  internal static let detailsForks = L10n.tr("Localizable", "details.forks", fallback: "Forks")
  /// Issues
  internal static let detailsIssues = L10n.tr("Localizable", "details.issues", fallback: "Issues")
  /// Last release version
  internal static let detailsRelease = L10n.tr("Localizable", "details.release", fallback: "Last release version")
  /// %@ / %@
  internal static func detailsRepositoryTitle(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "details.repository.title", String(describing: p1), String(describing: p2), fallback: "%@ / %@")
  }
  /// Stared by
  internal static let detailsStarred = L10n.tr("Localizable", "details.starred", fallback: "Stared by")
  /// %@ results
  internal static func searchResults(_ p1: Any) -> String {
    return L10n.tr("Localizable", "search.results", String(describing: p1), fallback: "%@ results")
  }
  /// Localizable.strings
  ///   GitExplorer
  /// 
  ///   Copyright © 2023 Rasmus Hilleke.
  internal static let searchTitle = L10n.tr("Localizable", "search.title", fallback: "Repository library")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
