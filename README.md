# TopMovie

TopMovie is a simple Swift iOS application that displays a list of popular movies using [TheMovieDB API](https://www.themoviedb.org/). It demonstrates clean architecture, local caching, and modern iOS development techniques.

---

## Features

-  Home Screen: Browse popular movies with title, poster, and rating.
-  Movie Details Screen: View detailed information including overview, language, and vote average.
-  Favorite/Unfavorite: Save favorite movies locally with persistence.
-  Offline Support: Automatically shows cached data when offline.
-  Loading indicators and elegant alert handling.

---

##Architecture

- **MVVM (Model-View-ViewModel)** pattern for better separation of concerns.
- **Dependency Injection** for easier testing and flexibility.
- **URLCache** for lightweight API response caching.

---

## Tech Stack

###  Language:
- Swift

###  Networking:
- [Alamofire](https://github.com/Alamofire/Alamofire) — Elegant HTTP networking

###  Image Handling:
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) — Async image loading and caching

###  UI Enhancements:
- [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) — Loading spinners
- [CDAlertView](https://github.com/candostdagdeviren/CDAlertView) — Stylish alert popups

---

##  Local Caching & Favorites

- **URLCache** is used to store API data for offline access.
- **Favorites** are saved locally using `UserDefaults` or a similar lightweight store.
- Favorite status is preserved across app launches and reflected in both screens.

---

## Screens

1. **Home View**  
   - Displays a list of popular movies (title, image, rating)
   - Tapping a movie opens the detail screen

2. **Movie Detail View**  
   - Overview, vote average, language, etc.
   - Favorite/unfavorite toggle button

---


##  Testing

- Includes unit testable ViewModels via Dependency Injection
- You can mock network and data layers for easier testing

---

##  Requirements

- iOS 13.0+
- Xcode 14+
- Swift 5

---

##  Screenshots (Optional)

![Home Screen](https://github.com/user-attachments/assets/cbc8efee-73b3-40a5-bca8-5d30c54944e9)

![Movie details](https://github.com/user-attachments/assets/26acc9ab-e98e-4fd0-8db0-dbda3f6bc0e8)




