// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Contact: Codable, Identifiable, TimeStampable {
  private enum CodingKeys: String, CodingKey {
    case id
    case createdAt
    case updatedAt
    case deletedAt

    case name
    case address
    case phone
    case favorite
  }

  public var database: SQLiteDatabase? = nil

  public var id: Int?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var deletedAt: Date?
  
  public var name: String?
  public var address: String?
  public var phone: String?
  public var favorite: Bool = false

  public init() {}
}

extension Contact: SQLitePersistable {}
