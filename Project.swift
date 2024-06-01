import ProjectDescription

let project = Project(
    name: "TodayWoon",
    targets: [
        .target(
            name: "TodayWoon",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TodayWoon",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["TodayWoon/Sources/**"],
            resources: ["TodayWoon/Resources/**"],
            dependencies: [
                .external(name: "Alamofire"),
                .external(name: "Then"),
                .external(name: "SnapKit"),
                .external(name: "CombineExt"),
                .external(name: "CombineCocoa"),
                .external(name: "Kingfisher")
            ]
        ),
        .target(
            name: "TodayWoonTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TodayWoonTests",
            infoPlist: .default,
            sources: ["TodayWoon/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TodayWoon")]
        ),
    ]
)
