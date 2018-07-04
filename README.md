# PhotoApp

## Getting Started
This app fetches photos from the [Unsplash Api](https://unsplash.com/developers). Signup and get an api key.
````
The API key is in Networking/NetworkConfiguration.swift. Copy and replace your key there.
````

## Preview

<img src="photo.png?raw=true" width="340px">


## Installation
### [CocoaPods](https://cocoapods.org/) **Recommended**
````ruby
pod 'SDWebImage'
````


## Architecture: MVVM Pattern

````swift
//Uses property observer and closures to achieve data binding.
//Great for avoiding the Reactive approach.

//Each ViewModel has a protocol to abstract implementation details from the viewModel, 
//Also makes it easier to test functionality with mocks etc.

// ViewModel/PhotoGridViewModel.swift
protocol PhotoGridViewModelProtocol {
    var networkService: NetworkService { get }
    var fetchingError: ((NetworkError) -> Void)? { get }
    var fetchingPhotos: (() -> Void)? { get }
    var didFinishFetch: ((_ photos: [Photo]) -> Void)? { get }
    func fetchPhotos(forPage page: Int)
}

class PhotoGridViewModel: PhotoGridViewModelProtocol {...}

extension PhotoGridViewModel {
    enum State {
        case idle
        case fetching
        case didFinishFetching([Photo])
        case fetchingError(NetworkError)
    }
}

/*
The PhotoGridViewModel is responsible for fetching photos and updating the controller with the photos.
It uses a property observer state, which is an enum.
When the value changes, simply call the closure or any func in the enum cases.
*/


// Controller/PhotoGridListViewController.swift
// In the controller instantiate your view model
private let viewModel = PhotoGridViewModel()

// Then in viewDidLoad call any of the closures you implemented
// Make sure a weak reference to cell is made, to avoid any retain cycle.
 viewModel.fetchingPhotos = { [weak self] in
            guard let `self` = self else { return }
            self.activityIndicatorView.startAnimating()
            self.loadingIndicatorView.isHidden = false
      }
````


