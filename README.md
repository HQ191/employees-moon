# Introduction
This iOS project is an app for looking up employees.

# Stack
* Swift 
* SwiftUI
* Combine
* Async/Await

# Setup Steps
1. Clone project
2. Open project in Xcode (Recommended Xcode 15.0 or above)
    
# Structure (MVVM-C)
The project follows MVVM-C architecture. The reason for choosing MVVM-C is that it provides a clear separation of concerns and makes the code more testable and maintainable.

## Coordinators
Coordinator is responsible for handling the navigation of a particular flow. The coordinator is responsible for creating the view and view model and setting up the bindings between them.<br/>
Each Coordinator has its own CoordonatorView where all the naivgational bindings takes place.

## Views
Each View is driven by its respective viewModel.
For making view the project is following a modular approach where the view is broken down into smaller components. Each component is a separate view file. <br/>
The view is also localized using the `xcstrings` file.

## ViewModels
The ViewModel is responsible for handling the business logic of the view. The ViewModel is responsible for making the network calls and updating the view. <br/>
For handling bussiness flows the view model takes levrage of use cases and service injection. 

## UseCases
Every use case is reponsible for handling a particular business flow and it comprises of an invoke method.

## Services
Services are responsible for grouping similar bussiness logic together. They are generally used system wide.

# Assets
The assets are broken down to Color, Image. <br/>
For localization a separate xcstrings file should be created for each view under localizables/catalogs and its corresponding strings file. <br/>
The images should be in PDF format. For adding new images add the new image name to ImageName enum in Images file 
