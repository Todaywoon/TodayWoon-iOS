//
//  TabCoordinator.swift
//  UIPractice
//
//  Created by 이숭인 on 5/31/24.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    func selectPage(_ page: TabbarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabbarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabbarPage] = [.home, .feed, .profile]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabbarPage.home.pageOrderNumber()
        
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .primary
        tabBarController.tabBar.unselectedItemTintColor = .gray
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabbarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())
        
        let tabBarItem: UITabBarItem
        switch page {
        case .home:
            // If needed: Each tab bar flow can have it's own Coordinator.
            //let viewModel = ReadyViewModel()
            //viewModel.coordinator = self
            tabBarItem = UITabBarItem(title: "Walk",
                                      image: UIImage(named: "Walk")?.withRenderingMode(.alwaysTemplate),
                                      selectedImage: nil)
            navController.tabBarItem = tabBarItem
            let readyVC = HomeViewController()
                        
            navController.pushViewController(readyVC, animated: true)
        case .feed:
            //let viewModel = SteadyViewModel()
            //viewModel.coordinator = self
            tabBarItem = UITabBarItem(title: "Feed",
                                      image: UIImage(named: "Feed")?.withRenderingMode(.alwaysTemplate),
                                      selectedImage: nil)
            navController.tabBarItem = tabBarItem
            
            let steadyVC = FeedViewController()
            
            navController.pushViewController(steadyVC, animated: true)
        case .profile:
            let viewModel = ProfileViewModel()
            viewModel.coordinator = self
            let profileVC = ProfileViewController(viewModel)
            
            tabBarItem = UITabBarItem(title: "My",
                                      image: UIImage(named: "My")?.withRenderingMode(.alwaysTemplate),
                                      selectedImage: nil)
            navController.tabBarItem = tabBarItem
            
            navController.pushViewController(profileVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabbarPage? { TabbarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabbarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabbarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
