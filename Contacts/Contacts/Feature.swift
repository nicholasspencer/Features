// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

import protocol FeaturesKit.FeatureDelegate
typealias FeaturesKitFeatureDelegate = FeaturesKit.FeatureDelegate

import class FeaturesKit.Feature
public typealias FeaturesKitFeature = FeaturesKit.Feature

import protocol FeaturesKit.IBRepresentable

public final class FeatureDelegate: FeaturesKitFeatureDelegate {
  public init() {}
}

public final class Feature: FeaturesKitFeature {
  public lazy var rootViewController: UIViewController? = {
    let rootViewController = Feature.storyboardRepresentation
    if
      let splitViewController = rootViewController as? UISplitViewController,
      let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as? UINavigationController {
      navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
      splitViewController.delegate = self
    }
    return rootViewController
  }()
}

extension Feature: UISplitViewControllerDelegate {
  public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
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
  
  public static var storyboardRepresentation: UIViewController? {
    return storyboard?.instantiateInitialViewController()
  }
}
