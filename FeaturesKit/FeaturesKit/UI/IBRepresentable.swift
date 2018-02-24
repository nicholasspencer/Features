// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol IBRepresentable: class {
  static var storyboard: UIStoryboard? { get }
  static var storyboardName: String? { get }
  static var storyboardIdentifier: String? { get }
}

extension IBRepresentable {
  public static var storyboard: UIStoryboard? {
    guard let name = storyboardName else { return nil }

    return UIStoryboard(name: name, bundle: Bundle(for: Self.self))
  }

  public static var storyboardName: String? {
    return String(describing: self)
  }

  public static var storyboardIdentifier: String? {
    return String(describing: self)
  }
}

extension IBRepresentable where Self: UIViewController {
  public static var storyboardRepresentation: Self? {
    guard let storyboardIdentifier = self.storyboardIdentifier else { return nil }

    return self.storyboard?.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self ?? nil
  }
}
