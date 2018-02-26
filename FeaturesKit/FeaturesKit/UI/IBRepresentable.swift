// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

public typealias IBRepresentable = IBRepresentableStoryboard & IBRepresentableNib

public protocol IBRepresentableStoryboard: class {
  static var storyboard: UIStoryboard? { get }
  static var storyboardName: String? { get }
  static var storyboardIdentifier: String? { get }
  static var storyboardInstance: UIViewController? { get }
}

extension IBRepresentableStoryboard {
  public static var storyboard: UIStoryboard? {
    guard let name = storyboardName else { return nil }

    return UIStoryboard(name: name, bundle: Bundle(for: self))
  }

  public static var storyboardName: String? {
    return String(describing: self)
  }

  public static var storyboardIdentifier: String? {
    return String(describing: self)
  }
}

extension IBRepresentableStoryboard {
  public static var storyboardInstance: UIViewController? {
    return self.storyboard?.instantiateInitialViewController()
  }
}

extension IBRepresentableStoryboard where Self: UIViewController {
  public static var storyboardInstance: Self? {
    guard let storyboardIdentifier = self.storyboardIdentifier else { return nil }

    return self.storyboard?.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self ?? nil
  }
}

public protocol IBRepresentableNib: class {
  static var nib: UINib? { get }
  static var nibName: String? { get }
  static var nibInstance: Any? { get }
}

extension IBRepresentableNib {
  public static var nib: UINib? {
    guard let name = nibName else { return nil }

    return UINib(nibName: name, bundle: Bundle(for: self))
  }

  public static var nibName: String? {
    return String(describing: self)
  }

  public static var nibInstance: Any? {
    return self.nib?.instantiate(withOwner: nil, options: nil).first
  }
}

public protocol IBRepresentableNibViewController: IBRepresentableNib where Self: UIViewController {
  static var nibInstance: UIViewController? { get }
}

extension IBRepresentableNibViewController {
  public static var nibInstance: UIViewController? {
    return Self(nibName: nibName, bundle: Bundle(for: self))
  }
}

public protocol IBRepresentableNibView: IBRepresentableNib where Self: UIView {
  static var nibInstance: UIView? { get }
}

extension IBRepresentableNibView {
  public static var nibInstance: UIView? {
    return self.nib?.instantiate(withOwner: nil, options: nil).first as? Self
  }
}

