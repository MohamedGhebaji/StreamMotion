# **StreamMotion - Video Streaming App** 🎥🚀

## **📌 Overview**
StreamMotion is a simple **video streaming application** built using **SwiftUI** and **modern Swift concurrency (`async/await`)**. It fetches videos from an API and displays them in a list with **infinite scrolling**. When a video is tapped, it plays in a full-screen player.

This project follows a **clean architecture approach**, making it **testable, scalable, and maintainable**.

---

## **🛠 Architecture**
This project follows the **Clean Architecture** principles, divided into **three layers**:

1. **Presentation Layer (SwiftUI Views)**
   - `VideoListView` → Displays the list of videos.
   - `VideoRowView` → Represents a single video item.
   - `VideoPlayerView` → Plays the video in full-screen.

2. **Domain Layer (Business Logic & Use Cases)**
   - `FetchVideosUseCase` → Fetches video data.
   - `MinutesAgoUseCase` → Calculates the time difference in minutes.

3. **Data Layer (Networking & Repository)**
   - `VideoRepository` → Fetches data from the API.
   - `ApiClient` → Handles API requests using `async/await`.
   - `VideoResponse` & `Video` → Codable models for parsing API responses.

### **📝 Feature Dependencies**
For simplicity, **features are currently interconnected**. However, in a **real-world project**, we should follow a **modular approach** where each feature is **independent** and communicates through a **Coordinator pattern** that knows all features and handles navigation.

---

## 📄 Module Dependencies Graph

Below is a visual representation of **module dependencies**:

![Layered Dependency Diagram of StreamMotionLibrary](https://github.com/user-attachments/assets/9a14d69a-49fa-48f0-aedb-b4c42a3db919)


---

## **📌 Features**
✅ **Fetch videos from API**  
✅ **Infinite scrolling**  
✅ **Full-screen video playback**  
✅ **Error handling for API failures**  
✅ **Unit-tested ViewModel, UseCases, and Model Parsing**  

---

## **🧪 Unit Tests**
This project includes **unit tests** to ensure reliability.

✅ **Model Parsing Test** → Ensures API response is correctly mapped.  
✅ **Use Case Tests** → Verifies fetching videos and handling API failures.  
✅ **ViewModel Tests** → Checks state updates, pagination, and error handling.

---

## 🔥 Areas for Improvement

To enhance this project, the following improvements should be made:

### **1️⃣ Use `SwiftyMocky` + `Sourcery` to Generate Mocks**
- Currently, mocks are written manually, which is **time-consuming** and **error-prone**.
- **Solution:** Use [**SwiftyMocky**](https://github.com/MakeAWishFoundation/SwiftyMocky) + [**Sourcery**](https://github.com/krzysztofzablocki/Sourcery) to automatically generate **protocol-based mocks**.

### **2️⃣ Use a Solid Dependency Injection Library**
- Instead of manually injecting dependencies
- **Solution:** Use [**Swift Dependencies**](https://github.com/pointfreeco/swift-dependencies) and inject dependencies using the `@Dependency` **property wrapper**.

### **3️⃣ Generate Mocks for Models**
- **Issue:** Currently, models are static, making testing **less flexible**.
- **Solution:** Generate **mock models** to improve **unit testing and UI previews**.

By implementing these improvements, the project will become **more scalable, maintainable, and testable**.
