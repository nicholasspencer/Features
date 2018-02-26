// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import UIKit

import FeaturesKit
import DayPlannerKit

public protocol FeatureDelegate: FeaturesKit.FeatureCoordinatorDelegate {}

public final class Feature: FeaturesKit.FeatureCoordinator {
  public weak var coordinatorDelegate: FeatureDelegate?

  public lazy var rootViewController: UIViewController? = self.storyboardInstance?.instantiateInitialViewController()

  public var database: SQLiteDatabase? {
    didSet {
      contactsDataSource?.database = database
      contactsViewController?.tableView?.reloadData()
    }
  }

  public init() {
    splitViewController?.delegate = self
    navigationController?.topViewController?.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    contactsViewController?.dataSource = self.contactsDataSource
  }

  private lazy var storyboardInstance: UIStoryboard? = Feature.storyboard
  private lazy var contactsDataSource: ContactsViewDataSource? = {
    let contactsDataSource = ContactsViewDataSource()
    contactsDataSource.database = database
    return contactsDataSource
  }()
}

extension Feature: ContactsViewControllerDelegate {
  public func contactsViewControllerRequestingNewContact(_ viewController: ContactsViewController) {

  }

  public func contactsViewController(_ viewController: ContactsViewController, didSelect contact: Contact) {

  }
}

extension Feature: UISplitViewControllerDelegate {
  public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    guard let topAsDetailController = secondaryAsNavController.topViewController as? ContactViewController else { return false }
    if topAsDetailController.contact == nil {
      // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
      return true
    }
    return false
  }
}

extension Feature: IBRepresentableStoryboard {
  public static var storyboardName: String? {
    return "Main"
  }
  
  public static var storyboardInstance: UIViewController? {
    return storyboard?.instantiateInitialViewController()
  }

  private var splitViewController: UISplitViewController? {
    guard let splitViewController = rootViewController as? UISplitViewController else { return nil }

    splitViewController.delegate = self

    return splitViewController
  }

  private var contactsNavigationController: UINavigationController? {
    guard
      let splitViewController = splitViewController,
      let navigationController = splitViewController.viewControllers.first as? UINavigationController else { return nil }

    return navigationController
  }

  private var contactsViewController: ContactsViewController? {
    guard
      let navigationController = contactsNavigationController,
      let contactsViewController = navigationController.viewControllers.first as? ContactsViewController else { return nil }

    contactsViewController.dataSource = contactsDataSource

    return contactsViewController
  }

  private var navigationController: UINavigationController? {
    guard
      let splitViewController = splitViewController,
      let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as? UINavigationController else { return nil }

    navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem

    return navigationController
  }

  private var contactViewController: ContactViewController? {
    guard
      let navigationController = navigationController,
      let contactViewController = navigationController.viewControllers.first as? ContactViewController else { return nil }

    return contactViewController
  }
}
