# AIConcentric
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

## 🧩 Python & TensorFlow Parallel
The project complements a TensorFlow course I’m following in Python, focused on **Supervised** and **Reinforcement Learning**.

If Python feels like **hand-flying** — fully manual —  
then SwiftUI feels like **autopilot** — you describe the goal and let it work.

---

## 🖼️ Screenshots
*(Add here:)*  
- AI → ML → Deep Learning  
- Supervised → Reinforcement Learning

---

## ⚙️ Requirements
- macOS 15 or later  
- Xcode 16+  
- Swift 6+  

---

## 🪪 License
MIT License © 2025 Didier Delhaisse
