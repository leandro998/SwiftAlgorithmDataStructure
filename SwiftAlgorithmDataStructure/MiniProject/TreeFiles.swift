//
//  TreeFiles.swift
//  SwiftAlgorithmDataStructure
//
//  Created by Hermilo Ortega and Leandro Prado on 2020-06-25.
//  Copyright © 2020 Hermilo Ortega and Leandro Prado. All rights reserved.
//  Mini project for CICCC
//

import Foundation

var nFiles = 0, nFolders = 0, numbers = [Int]()

/* calling function in main.swift:
numbers = fileSystemCrawler(at: URL(fileURLWithPath: FileManager.default.currentDirectoryPath), 0, "\t├─", &nFiles, &nFolders)
print("\n\(numbers[0] - 1) directories, \(numbers[1]) files\n")
*/

func fileSystemCrawler(at url: URL, _ index: Int, _ tab: String, _ nFolders: inout Int, _ nFiles: inout Int) -> [Int]{
    let content = try! FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
    //insert the sum of files and folders when finish processing:
    if index + 1 > content.count { return [nFolders, nFiles] }
    print((index + 1 == content.count) ? "\(tab[tab.index(tab.startIndex, offsetBy: 0)..<tab.index(tab.startIndex, offsetBy: tab.count - 2)])└─ \(content[index].lastPathComponent)":"\(tab) \(content[index].lastPathComponent)")
    //if the extension is empty it's a folder, else is a file:
    if content[index].pathExtension != ""{ nFiles = nFiles + 1 }
    else{ nFolders = nFolders + 1 }
    //if the content is a folder it should keep going down, so we call the function again changing the tab to |
    if content[index].hasDirectoryPath {
        fileSystemCrawler(at: content[index].absoluteURL, 0, "\t│" + tab, &nFolders, &nFiles)
    }
    //call recursive the function until we have the base case of index+1 > content.count
    return fileSystemCrawler(at: url, index + 1, tab, &nFolders, &nFiles)
}


/* ============== Project Crawl Description ==============
 
 In this mini-project, you are going to build your own file system crawler.
 You are required to write a recursive program in Swift to print all files/directories from the given path with the number of files and directories.
 
 Some useful characters to draw. (copy/paste)
    1. ├─
    2. └─
    3. │

 To Compile your .swift to executable:
        $ xcrun -sdk macosx swiftc <file_name>.swift -o <executable_name>
 
 Useful API: https://developer.apple.com/documentation/foundation/filemanager
        Declaration: class FileManager : NSObject
 
 Example Output:
 ├─ asn1
 │    ├─ vc_is_negative.c
 │    ├─ .DS_Store
 │    └─ asn1.zip
 ├─ asn6
 │    ├─ .DS_Store
 │    ├─ ex00
 │    │    ├─ .DS_Store
 │    │    └─ vc_putstr.c
 │    └─ ex00.zip
 ├─ asn8
 │    ├─ vc_show_tab.c
 └─ preprocessor
 ├─ .DS_Store
 └─ multiply.c

 
-------Suggestions:

//func fileExists(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool {
//
//}


//func contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions = []) throws -> [URL] {
//
//}

 
 ------how code works on line 23:
 
 print(
    (index + 1 == content.count) ?
        "\(tab[tab.index(tab.startIndex, offsetBy: 0)
            ..<tab.index(tab.startIndex, offsetBy: tab.count - 2)
              ])└─ \(content[index].lastPathComponent)"
        :
        "\(tab) \(content[index].lastPathComponent)"
       ) //end print
 
 */

