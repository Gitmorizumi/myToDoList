import PackageDescription

let package = Package(
  name: "myToDoList",
  targets: [
    Target(name: "Server", dependencies: [.Target(name: "myToDoList")]),
    Target(name: "myToDoList")
  ],
  dependencies: [
    .Package(url: "https://github.com/IBM-Swift/Kitura", majorVersion: 1, minor: 6),
    .Package(url: "https://github.com/IBM-Swift/HeliumLogger", majorVersion: 1, minor: 6)
  ]
)
