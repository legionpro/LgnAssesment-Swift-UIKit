# LgnAssesment_Swift_UIKit



## Some Notes about the results

### goals:

-  to implement the requirements  and in the time

### approaches:

- demonstrate of using the modern native and third-patry API in swift porject;
- avoid overengeneering
- SOLID, clean architecture, MVVM (in appropriate cases)
- spent little time for UI

### results:

- mostly used the native API and approaches + Kingfisher (third-part package)
- Protocol Oriented dev. and Dependency Injection
- UIKit without Storyboards and XIB, extensions, protocols
- UICollectionViewDiffableDataSource
- implemented very simple approach pagenation functionality (it shoould be smarter in real app, server-side   uses a certain approach for pagination.)
- implemented the one endpoint on the client (the data structure is extended and very complicated. so it needs more time)
- implemented Sections in the CollectionVIew ( but only one section -  it is not clear wich data should be used so sections' sign, needs to be discussed. As the result - single section - no headers)
- separate NetworkService + Data Maping functionality
- Swift Combine + @Observable/@Published + JSON decoder + publishers/subsriptions (in appropriate cases)
- async/await + task + @MainActor
- Procesed with the server API (found some issues and resolver it for local client)
- Implemente an unit test for async/publisher functionality.

### issues and further improvement:

- I tryed to avoid overengeneering, but a more complicated approaces could be implemented in future :
  - modular architectere - separate modules for different project's layer;  
  - add coordinator pattern in case of more complicated flow
  - to discus smarter pagenation (needs to be cosider the curren server-side approac)
  - improve UI and user experience
  - implemet more UnitTests / UITests 
  - implement all endpoints  - it needs more time
- found an issue with server-side data format (same name for different items - it crashed decoding on client side)
