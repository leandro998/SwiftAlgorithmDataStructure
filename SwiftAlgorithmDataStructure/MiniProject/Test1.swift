//
//  Test1.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Leandro Prado on 2020-06-25.
//  Copyright © 2020 Leandro Prado. All rights reserved.


// NOT WORKING PROPERLY

import Foundation

func fileExistsTest(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) {

    let fileSystem = FileManager.default
    let rootPath = "/"
 
    // Enumerate the directory tree (which likely recurses internally)...
 
    if let fsTree = fileSystem.enumerator(atPath: rootPath) {
 
        while let fsNodeName = fsTree.nextObject() as? NSString {
            let fullPath = "\(rootPath)/\(fsNodeName)"
            var isDir: ObjCBool = false
            fileSystem.fileExists(atPath: fullPath, isDirectory: &isDir)
 
            if !isDir.boolValue && fsNodeName.pathExtension == "txt" {
                print(fsNodeName)
            }
        }
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func getAllFiles() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    if (paths.count == 0) {
        return getDocumentsDirectory()
    }
    for i in 0..<paths.count {
        let documentsDirectory = paths[i]
        return documentsDirectory
    }
    
    return getAllFiles()
}

//func getAllObjects() {
//    let fileManager = FileManager.default
//    let folderPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//    let enumerator:FileManager.DirectoryEnumerator = fileManager.enumeratorAtPath("/Users/leandro998/Documents")!
//
//    for url in enumerator.allObjects {
//        print("\((url as! NSURL).path!)")
//    }
//
//}

func fileExistsTest() {
    let filemgr = FileManager.default
//    let currentPath = filemgr.currentDirectoryPath
    let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
    let docsDir = dirPaths[0].path
    
    do {
        let filelist = try filemgr.contentsOfDirectory(atPath: docsDir)

        for filename in filelist {
            print(filename)
        }
    } catch let error {
        print("Error: \(error.localizedDescription)")
    }
}
    

