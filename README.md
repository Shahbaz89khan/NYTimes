# NYTimes
The NYTimes task completed with MVVM  and Coordinator pattern with showing list of Articles and detail of article.

# Content

 * Overview
 * How To Run
 * Unit Testing 
 * App Features

 # Overview
 
 * **Controller**: Contains **ArticlesListViewController** . This controller fectch the data from the ArticlesListViewModel. 
 * **ArticlesListViewController** . This controller will be called on clicking any cell from ArticleListViewController.
 
 * **ArticlesListViewModel**: Contain **ArticlesRemoteRepository** .This module responsible to get the data from the repo and send it to the viewcontroller and then viewController will send data to respective views
 
 * **Models**: Contains   **Article**  **Media**  **MediaMetaData**  **TimePeriod**

 * **Coordinator**: Contains **Coordinator** and **MainCoordinator** . The responsiblity of coordinators is to handle the navigation of the app and setup the start of the app.
 
 * **Repository**: Contains **ArticlesRemoteRepository** .This repo will contact with ServiceApi to fetch the Articles and will send back to respective ViewModel
 

# How To run

To run the project use the 12.5 xcode

# Unit Testing 
The project is completed with the unit testing


# App Features
* MVVM with Coordinator pattern
* Combine
* Storyboard
