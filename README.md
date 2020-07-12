# MountainSearch

- Check out the branch **master** to see the primary version of this app!
- Click here to visit the Sketch repos used to create all assets/app icon for this iOS app:
[MountainSearch_Sketch](https://github.com/mkKreations/MountainSearch_Sketch)


## Screenshots

### Home Screen

[![Home-Screen-i-OS13.png](https://i.postimg.cc/VsK2KBZN/Home-Screen-i-OS13.png)](https://postimg.cc/qgCmRnTf)

### Home Screen with search text

[![Home-Screen-Search-i-OS13.png](https://i.postimg.cc/ncMggjNG/Home-Screen-Search-i-OS13.png)](https://postimg.cc/Mv29jT6n)

### Detail Screen

[![Detail-Screen-i-OS13.png](https://i.postimg.cc/MHpNWvHx/Detail-Screen-i-OS13.png)](https://postimg.cc/dkg46QGS)


## Description

This version of the app is specifically tailored to devices running iOS13 and up. Visually, both versions of the
app are practically identical. However, as the name of the branch implies, this version of 
the app takes advantage of features introduced specifically in Apple's iOS13 SDK such as CompositionalLayout
and DiffableDatasource. In addition, this version of the app maintains the state of the UISearchBar independently
as opposed to the version on master which uses a UISearchController, which does much of the heavy-lifting for us. 
And most importantly, this version of the app integrates SwiftUI into a codebase that is primarily UIKit. 


## Features

- Manages changes in collectionView by taking snapshots using DiffableDatasource
- Uses custom CompositionalLayout to create layout of items in collectionView
- Detail screen is built using small, reusable View components produced using SwiftUI
- Manages UISearchBar and its state manually
- Loads raw data from CSV


## Feedback

Any and all feedback is welcome - including pull requests.
