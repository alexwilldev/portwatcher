//
//  main.swift
//  PortWatcher
//
//  Created by Alex Williams on 10/29/26.
//

import Foundation
import IOKit

let filter = IOServiceMatching("IOUSBHostDevice") // let instead of var because this won't change
var iterator: io_iterator_t = 0


//io_iterator_t = IOServiceGetMatchingService(kIOMainPortDefault, CFDictionary!)

IOServiceGetMatchingServices(kIOMainPortDefault, filter, &iterator)

var counter = 0

var device = IOIteratorNext(iterator)

while device != 0 {
    counter = counter + 1
    IOObjectRelease(device)
    device = IOIteratorNext(iterator)

    
}
print(counter)
