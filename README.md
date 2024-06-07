# LgnAssesment_Swift_UIKit



## Some Notes about the results

### goals:

-  to implement the requirements  and in the time

### approaches:

- demonstrate of using the modern native and third-party API in swift projects;
- avoid overengeneering
- SOLID, clean architecture, MVVM (in appropriate cases)
- spent little time on UI

### results:

- mostly used the native API and approaches + Kingfisher (third-part package)
- Protocol Oriented dev. and Dependency Injection
- UIKit without Storyboards and XIB, extensions, protocols
- UICollectionViewDiffableDataSource
- implemented a straightforward approach to pagination functionality (it should be smarter in real app, server-side uses a certain approach for pagination.)
- implemented the one endpoint on the client (the data structure is extended and very complicated. so it needs more time)
- implemented Sections in the CollectionVIew ( but only one section - it is not clear which data should be used so the sections' sign, needs to be discussed. As a result - a single section - with no headers)
- separate NetworkService + Data Mapping functionality
- Swift Combine + @Observable/@Published + JSON decoder + publishers/subscriptions (in appropriate cases)
- async/await + task + @MainActor
- Processed with the server API (found some issues and resolver it for local client)
- Implemented a unit test for async/publisher functionality.

### issues and further improvement:

I tried to avoid overengineering, but more complicated approaches could be implemented in future :

- modular architecture - separate modules for different project layers;
- add coordinator pattern in case of a more complex flow
- to discuss smarter pagination (needs to be considered the current server-side approach)
- improve UI and user experience
- implement more UnitTests / UITests
- implement all endpoints - it needs more time
- found an issue with server-side data format (same name for different items - it crashed decoding on the client side)
