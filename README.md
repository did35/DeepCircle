# DeepCircle  
**AI • ML • DL Visual Education App**  

Created by [Didier Delhaisse](https://www.linkedin.com/in/didierdelhaisse)  
*Airline Captain | Swift + visionOS Developer | Lifelong Learner*

## AIConcentric
A small SwiftUI 6+ demo app visualizing the relationship between **Artificial Intelligence**, **Machine Learning**, and **Deep Learning** using concentric circles — with a focus on **MVVM**, **@Observable**, and **top-level dependency injection**.

---

## 🧠 Overview
This demo shows two conceptual datasets:
- **AI → Machine Learning → Deep Learning**
- **Supervised → Reinforcement Learning**

Both are rendered through the same SwiftUI view thanks to Swift 6’s new `@Environment` support for `@Observable` models.  
The `AICirclesViewModel` is injected once at the app level, and all views access it via the environment.

---

## 🏗️ Architecture
- **Language:** Swift 6+
- **Frameworks:** SwiftUI + Observation (`@Observable`, `@Environment`)
- **Pattern:** MVVM (Model–View–ViewModel)
- **Data binding:** Pure SwiftUI, no Combine

### Key Components
| File | Purpose |
|------|----------|
| `AIConcentricApp.swift` | App entry point, injects the ViewModel globally |
| `AICirclesViewModel.swift` | Observable ViewModel managing datasets and state |
| `AILayer.swift` | Model for each circle layer |
| `RootView.swift` | Hosts Picker to switch between datasets |
| `ConcentricCirclesView.swift` | Renders concentric circle visualization |

---

## 💡 Concepts Demonstrated
- Top-level dependency injection using `.environment(vm)`
- `@Observable` model shared across all views
- Geometry-based responsive layout (`GeometryReader`)
- Simple animations and focus interaction
- Clear MVVM separation and reusable view logic

---

## 🧩 Thread Safety and Coordination

For aviation professionals exploring Swift, this section draws a parallel between **thread safety in code** and **crew coordination in flight**.  
Just as a well-coordinated cockpit avoids overlapping inputs and ensures clarity, SwiftUI’s architecture keeps state updates synchronized and predictable.

`@Environment`, `@MainActor`, and structured concurrency (`.task`, `await`) work together to guarantee that all UI updates happen safely on the main thread — without manual locks or dispatch queues.

| **Concept** | **Responsibility / Role in SwiftUI** | **Pilot Analogy** |
|--------------|---------------------------------------|--------------------|
| **`@Environment`** | Provides shared, consistent state across all views. Acts like a “public intercom” for app-wide information. | The **cockpit intercom** — all crew hear the same call (shared state) and react consistently without passing notes around. |
| **SwiftUI runtime** | Coordinates when and how views update; guarantees UI updates occur on the **main thread** to avoid race conditions. | **ATC (Air Traffic Control)** — keeps everyone on the right frequency, prevents simultaneous transmissions (data races). |
| **`@MainActor`** | Ensures that all UI-facing logic runs on the **main thread**, isolating it from background work. | The **Captain’s channel** — only one voice can issue final commands to flight controls; ensures clarity and safety. |
| **Concurrency (`.task`, `await`)** | Runs asynchronous or background operations safely, then hands results back to the main thread for UI updates. | The **First Officer** performing external tasks (weather check, fuel calc) while the Captain keeps flying — teamwork through controlled hand-offs. |
| **Actors (Swift Concurrency)** | Provide isolated, thread-safe data regions for complex state management. | **Crew members with their own defined duties** — each handles their zone without interfering with others, but reports through proper channels. |
| **SwiftUI view updates** | Automatically propagated, scheduled, and thread-safe thanks to the declarative model. | **Flight deck coordination loop** — every action triggers updates (checklists, callouts) in perfect sequence and timing. |

---

### 🧭 Summary

- `@Environment` **shares state safely** → like a crew communication system.  
- `@MainActor` **keeps control on one channel** → like a captain maintaining authority.  
- SwiftUI **ensures updates stay on the main thread** → like ATC sequencing takeoffs.  
- Concurrency (`.task`, `await`, `actor`) **delegates background duties safely** → like good CRM in flight.

---

## 🪩 Dual-Platform Showcase

DeepCircle now runs seamlessly on **iOS** and **visionOS**, demonstrating the flexibility of SwiftUI’s declarative architecture.

| Platform | Target | Scene Type | Icon | Notes |
|-----------|---------|-------------|-------|--------|
| **iOS** | `DeepCircleApp` | `WindowGroup` (standard) | 1024×1024 iOS icon | Tested on iPhone 15 & iPad simulators |
| **visionOS** | `DeepCircleVisionApp` | `WindowGroup` (spatial window) | 3D concentric-circle icon | Tested on Apple Vision Pro simulator |

### ✨ Highlights
- **Single shared codebase** under `Shared/` (Model, ViewModel, Views).  
- **Distinct App targets** for each platform with their own assets and window scenes.  
- **Glass effect & spatial layout** on visionOS for a native floating-window experience.  
- **MVVM pattern** and **@Observable ViewModel** used across both environments.  
- Demonstrates true SwiftUI interoperability between iOS 18 and visionOS 2.0 SDKs.

### 🧭 Architecture summary

Shared logic → Compiled once per target → Platform-specific window and assets

---

## 🖼️ Screenshots
<img width="150" height="325" src="https://github.com/user-attachments/assets/5ab1b303-9d72-4534-b1dc-4a5d9b2a4d68" />
<img width="150" height="325" src="https://github.com/user-attachments/assets/b24e710d-e7c1-41b5-83f6-49a503e33690" />
<img width="150" height="325" src="https://github.com/user-attachments/assets/72b8269d-261f-4782-b98a-eafac028e7c6" />
<img width="150" height="325" src="https://github.com/user-attachments/assets/7008c054-0042-4d48-b37a-12d6b328f7ba" />
 <img width="480" height="270" src="https://github.com/user-attachments/assets/05d02753-1766-4c5f-ba18-0c3443367149" />

- AI → ML → Deep Learning  
- Supervised → Reinforcement Learning

---

## 🧩 Python & TensorFlow Parallel
The project complements a TensorFlow course I’m following in Python, focused on **Supervised** and **Reinforcement Learning**.

If Python feels like **hand-flying** — fully manual —  
then SwiftUI feels like **autopilot** — you describe the goal and let it work.

---

## ⚙️ Technologies

| Component | Description |
|------------|-------------|
| **Language** | Swift 6.2 |
| **Framework** | SwiftUI |
| **Pattern** | MVVM |
| **Concurrency** | `.task`, `@State`, `@Environment`, `async/await` |
| **IDE** | Xcode 26.0 + |
| **Target** | iOS 18.0, visionOS 26+ |

---

## 🪪 License
MIT License © 2025 Didier Delhaisse
