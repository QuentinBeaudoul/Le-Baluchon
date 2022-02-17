//
//  Result.swift
//  Extension
//
//  Created by Quentin Beaudoul on 17/02/2022.
//

import Foundation

extension Result where Success == Void {
    public static func success() -> Self { .success(()) }
}
