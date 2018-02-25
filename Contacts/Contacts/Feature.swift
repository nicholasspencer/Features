// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit
import FeaturesKit

public protocol FeatureDelegate: FeaturesKit.FeatureDelegate {}

public final class Feature: FeaturesKit.Feature {
  public weak var coordinatorDelegate: FeatureDelegate?

  public init() {
    splitViewController?.delegate = self
    navigationController?.topViewController?.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
  }

  public lazy var rootViewController: UIViewController? = {
    return self.storyboardInstance?.instantiateInitialViewController()
  }()

  private lazy var storyboardInstance: UIStoryboard? = Feature.storyboard

  private var splitViewController: UISplitViewController? {
    guard let splitViewController = rootViewController as? UISplitViewController else { return nil }

    return splitViewController
  }

  private var navigationController: UINavigationController? {
    guard
      let splitViewController = splitViewController,
      let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as? UINavigationController else { return nil }

    return navigationController
  }
}

extension Feature: UISplitViewControllerDelegate {
  public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    guard let topAsDetailController = secondaryAsNavController.topViewController as? ContactViewController else { return false }
    if topAsDetailController.detailItem == nil {
      // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
      return true
    }
    return false
  }
}

extension Feature: IBRepresentable {
  public static var storyboardName: String? {
    return "Main"
  }
  
  public static var storyboardInstance: UIViewController? {
    return storyboard?.instantiateInitialViewController()
  }
}
