// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol TimeStampable {
  var createdAt: Date? { get set }
  var updatedAt: Date? { get set }
  var deletedAt: Date? { get set }
}
