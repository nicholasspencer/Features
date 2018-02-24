// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Contact: Codable {
  public var uuid = UUID()
  
  public var name: String?
  public var address: String?
  public var phone: String?

  public var favorite: Bool = false
}

extension Contact: SQLitePersistable {
  public typealias Storage = SQLiteDatabase
}
