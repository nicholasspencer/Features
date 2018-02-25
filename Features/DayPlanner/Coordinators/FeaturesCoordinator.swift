// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import FeaturesKit

import class Kontacts.FeatureDelegate
typealias ContactsFeatureDelegate = Kontacts.FeatureDelegate

import class Kontacts.Feature
typealias ContactsFeature = Kontacts.Feature

import class Appointments.FeatureDelegate
typealias AppointmentsFeature = Appointments.Feature

import class Appointments.Feature
typealias AppointmentsFeatureDelegate = Appointments.FeatureDelegate


final class FeaturesCoordinator: Coordinator, CoordinatorDelegate {
  lazy var contactsFeatureDelegate = ContactsFeatureDelegate()
  lazy var contacts: ContactsFeature = {
    let contactsFeature = ContactsFeature()
    contactsFeature.featureDelegate = contactsFeatureDelegate
    contactsFeature.coordinatorDelegate = self
    return contactsFeature
  }()

  lazy var appointmentFeatureDelegate = AppointmentsFeatureDelegate()
  lazy var appointmentFeature: AppointmentsFeature = {
    let appointmentFeature = AppointmentsFeature()
    appointmentFeature.featureDelegate = appointmentFeatureDelegate
    appointmentFeature.coordinatorDelegate = self
    return appointmentFeature
  }()
}
