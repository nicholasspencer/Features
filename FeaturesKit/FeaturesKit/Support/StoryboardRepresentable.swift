// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public typealias StoryboardIdentifier=String

public protocol StoryboardRepresentable: class {
  static var storyboard: UIStoryboard? { get }
  static var storyboardIdentifier: StoryboardIdentifier { get }
}

extension StoryboardRepresentable {
  public static var storyboard: UIStoryboard? {
    let identifier = String(describing: self)
    let storyboard = UIStoryboard(name: identifier, bundle: Bundle(for: Self.self))
    return storyboard
  }

  public static var storyboardIdentifier: StoryboardIdentifier {
    return String(describing: self)
  }
}

extension StoryboardRepresentable where Self: UIViewController {
  public static var defaultInstantiation: Self? {
    return self.storyboard?.instantiateViewController(withIdentifier: self.storyboardIdentifier) as? Self ?? nil
  }
}
