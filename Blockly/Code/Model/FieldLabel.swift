/*
* Copyright 2015 Google Inc. All Rights Reserved.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation

/**
Non-editable text field. Used for titles, labels, etc.
*/
@objc(BKYFieldLabel)
public final class FieldLabel: Field {
  // MARK: - Properties

  /// The text label of the field
  public var text: String {
    didSet {
      if !self.editable {
        self.text = oldValue
      }
      if text != oldValue {
        delegate?.didUpdateField(self)
      }
    }
  }

  // MARK: - Initializers

  public init(name: String, text: String) {
    self.text = text
    super.init(name: name)
  }

  // MARK: - Super

  public override func copyField() -> Field {
    return FieldLabel(name: name, text: text)
  }

  public override func setValueFromSerializedText(text: String) throws {
    throw BlocklyError(.ModelIllegalState, "Label field text cannot be set after construction.")
  }

  public override func serializedText() throws -> String? {
    // Return nil. Labels shouldn't be serialized.
    return nil
  }
}