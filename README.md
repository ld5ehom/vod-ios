# VOD(Video-On-Demand) iOS App

## Project Overview 
- This iOS app utilizes a VOD platform for seamless video playback, storage, and delivery. It includes essential features like user login, video streaming with full-screen support, personal profiles, saved videos, and chat. 
- Utilized: Swift, UIKit, Swift Concurrency, AVFoundation, AVKit, MVVM, Firebase 


-----

## Milestones
- M1 : App Basic Functionality Development
- M2 : Advanced Features and Testing

-----

## Task List
### M1: App Basic Functionality Development

**Task 1. Launch Screen**
   - **Issues** - [task-1-launch](https://github.com/ld5ehom/vod-ios/tree/task-1-launch)
   - **Details** :
     - **Launch Screen** - [commit b7a9496](https://github.com/ld5ehom/vod-ios/commit/b7a9496601fc934e4a2ec9f4f85090e46b2226ea)
       - Implemented animation using Auto Layout


**Task 2. Login Page**
   - **Issues** - [task-2-login](https://github.com/ld5ehom/vod-ios/tree/task-2-login)
   - **Details** :
     - **Login Storyboard and ViewController Setup** - [commit 503bae0](https://github.com/ld5ehom/vod-ios/commit/503bae01d5c957ae39a429b0a18eb6eb510bde43) 
       - Created a storyboard and connected it to a `LoginViewController`.
       - Configured basic UI elements, including a login button with rounded corners, border, and custom color.
       - Applied Auto Layout constraints to ensure proper button sizing and positioning across devices.
 

**Task 3. Home Page**
   - **Issues** - [task-3-home](https://github.com/ld5ehom/vod-ios/tree/task-3-home)
   - **Details** :
     - **HomeViewCell and HomeViewController** 
       - Implemented the home screen using a UITableView within HomeViewController and integrated it with a TabBarController for navigation.
       - Used custom cells created with .xib files to display video content and other sections (header, recommendations, and footer) in the table view.
       - Managed UI elements inside the .xib cells by overriding awakeFromNib() to configure views when the cell is loaded.


**Task 4. My Page**


**Task 5. Video Page**


**Task 6. Live Page**




### M2: Advanced Features and Testing

**Task 7. Comprehensive Testing and Debugging**


-----
## Progress Tracking

- **Overall Progress** : Task 3 In Progress


-----
## Reference Site
- Firebase Structure Data : https://firebase.google.com/docs/database/ios/structure-data?hl=en
- Firebase Database Reference : https://firebase.google.com/docs/database/ios/lists-of-data?hl=en
- Kingfisher Library : https://github.com/onevcat/Kingfisher.git
- fastlane : https://docs.fastlane.tools/

-----
## Getting Started
### Install 

**Homebrew** : 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Clone the repository** : 
```
git clone https://github.com/ld5ehom/vod-ios.git
``` 

**CocoaPods**:
```
pod install
```

**fastlane**:
```
brew install fastlane
```

-----
### Setup

**fastlane**:
```
fastlane init
```


-----
### Start

**fastlane**:
```
fastlane increment_build
```

