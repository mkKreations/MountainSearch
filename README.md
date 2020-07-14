# MountainSearch

- Check out the branch **iOS13+** to see the version of this app using exclusive features from Apple's iOS13 SDK!
- Click here to visit the Sketch repos used to create all assets/app icon for this iOS app:
[MountainSearch_Sketch](https://github.com/mkKreations/MountainSearch_Sketch)


## Screenshots

### Home Screen

[![Home-Screen.png](https://i.postimg.cc/qMWVM5Qh/Home-Screen.png)](https://postimg.cc/2VdX0Tsr)

### Home Screen with search text

[![Home-Screen-Search.png](https://i.postimg.cc/Gh4nRCPn/Home-Screen-Search.png)](https://postimg.cc/nCfPKNw3)

### Detail Screen

[![Detail-Screen.png](https://i.postimg.cc/qBbHWR3G/Detail-Screen.png)](https://postimg.cc/t7xcx9D1)


## Description

This is a simple iOS that allows a user to search through a number of famous Mountains and learn basic
details about them. The basis of this app is a collectionView with a UISearchController. This version of
the app beautifully, and seamlessly, animates when as a user searches. The sledgehammer approach of reloadData()
has been replaced instead with only reloading the necessary indexPaths to produce a much more lively feeling. 
This app splits responsibility in order to manage the collectionView and search controller properly by having 
types that act specifically as the dataSource/delegate/flowLayout and so on. This app is built entirely 
on UIKit and is designed to run on devices running iOS11 and up.


## Features

- Manages indexPaths to create seamless search animation as user types
- Uses custom classes to manage all aspects of UICollectionView
- Utilizes UISearchController to manage results of UICollectionView
- Loads raw data from CSV


## Disclaimer

Some issues identified:

- IndexPaths are reset when returning from detail screen


## Feedback

Any and all feedback is welcome - including pull requests.
