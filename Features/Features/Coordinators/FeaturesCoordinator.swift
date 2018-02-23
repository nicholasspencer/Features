// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import Kontacts
import Appointments

final class FeaturesCoordinator: Coordinator, CoordinatorDelegate {
  lazy var contactsFeatureDelegate = Kontacts.FeatureDelegate()
  lazy var contactsFeature: Kontacts.Feature = {
    let contactsFeature = Kontacts.Feature()
    contactsFeature.featureDelegate = contactsFeatureDelegate
    contactsFeature.coordinatorDelegate = self
    return contactsFeature
  }()

  lazy var appointmentFeatureDelegate = Appointments.FeatureDelegate()
  lazy var appointmentFeature: Appointments.Feature = {
    let appointmentFeature = Appointments.Feature()
    appointmentFeature.featureDelegate = appointmentFeatureDelegate
    appointmentFeature.coordinatorDelegate = self
    return appointmentFeature
  }()
}
