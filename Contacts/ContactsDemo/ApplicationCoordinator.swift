// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import Kontacts

protocol ApplicationCoordinatorDelegate: CoordinatorDelegate {}

final class ApplicationCoordinator: Coordinator, CoordinatorDelegate, UISplitViewControllerDelegate {
  weak var coordinatorDelegate: ApplicationCoordinatorDelegate?

  lazy var database: SQLiteDatabase? = {
    guard
      let database = try? SQLiteDatabase(),
      let _ = try? database.prepare()
    else { return nil }

    return database
  }()

  lazy var window: UIWindow = {
    return UIWindow(frame: UIScreen.main.bounds)
  }()

  lazy var contactsFeatureDelegate = Kontacts.FeatureDelegate()
  lazy var contactsFeature: Kontacts.Feature = {
    let contactsFeature = Kontacts.Feature()
    contactsFeature.featureDelegate = contactsFeatureDelegate
    contactsFeature.coordinatorDelegate = self
    return contactsFeature
  }()

  func presentApplication() {
    self.window.rootViewController = self.contactsFeature.rootViewController
    self.window.makeKeyAndVisible()
  }
}
