// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import Contacts
import Appointments

final class FeaturesCoordinator: Coordinator, CoordinatorDelegate {
  lazy var contactsFeatureDelegate = Contacts.FeatureDelegate()
  lazy var contactsFeature: Contacts.Feature = {
    let contactsFeature = Contacts.Feature()
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
