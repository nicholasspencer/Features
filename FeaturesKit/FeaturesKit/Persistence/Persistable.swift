// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol Persistable {
  associatedtype Storage
  
  static func findAll(in store: Storage, completion: @escaping (Self) throws -> Void) rethrows
  func save(in store: Storage, completion: @escaping (Self) throws -> Void) rethrows
}
