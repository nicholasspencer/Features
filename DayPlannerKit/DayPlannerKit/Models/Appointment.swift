// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Appointment: Codable, Identifiable, TimeStampable {
  private enum CodingKeys: String, CodingKey {
    case id
    case createdAt
    case updatedAt
    case deletedAt
    case startDate
    case endDate
  }

  public var database: SQLiteDatabase? = nil

  public var id: Int?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?

  public var contacts = [Contact]()
  public var startDate: Date?
  public var endDate: Date?

  public init() {}
}

extension Appointment: SQLitePersistable {}


struct AppointmentContacts: Codable, TimeStampable {
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case deletedAt
  }

  public var database: SQLiteDatabase? = nil
  
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?

  public init() {}
}

extension AppointmentContacts: SQLitePersistable {
  var persisted: Bool {
    return false
  }

  static var tableName: String {
    return "appointment_contacts"
  }
}

