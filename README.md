# Google Cardboard VR & Chapter Dialogue Manager System for Unity

> This repository contains the **full Unity project** for an interactive mobile VR experience built with Google Cardboard.
>
> While the project includes various scenes, scripts, and assets, this README focuses specifically on the **two core systems**:
>
> 1. **Google Cardboard VR System** – Custom integration of Google’s mobile VR SDK using Unity’s XR Management framework.
> 2. **Chapter Dialogue Manager System** – A modular system for driving animated, voiced, and interactive storytelling with characters and prefabs.

These systems are designed to work together seamlessly in a fully immersive VR storytelling environment.
"""

# Google Cardboard VR Custom Plugin for Unity

> A custom implementation of the Google Cardboard XR plugin tailored for Unity, enabling lightweight mobile VR experiences.

---

### 🧩 Overview

This Unity plugin supports **Google Cardboard** VR development across Android and iOS platforms using Unity’s XR plugin architecture. It provides:

* Head tracking
* Stereo rendering
* Touch input emulation (Cardboard button)
* Device-specific configuration via QR codes
* Custom reticle pointer for gaze interaction

---

### 📁 Project Structure

* `Scripts/Google.XR.Cardboard/`

  * `Api.cs`: Main API for detecting input, device parameters, scanning QR codes, and updating head tracking.
  * `ApiConstants.cs`: Platform-specific bindings for native plugins.
  * `XRLoader.cs`: Unity XR Loader class to initialize, start, and stop XR subsystems.
  * `XRSettings.cs`: Placeholder for XR configuration (used by XR Management).
  * `Widget.cs`: Utility for rendering onscreen UI widgets (e.g., gear, close button).
  * `CardboardReticlePointer.cs`: Gaze-based interaction pointer with support for Unity events.

* `Plugins/iOS/GfxPluginCardboard.a`: Static iOS library compiled from native Cardboard SDK code.

* `UnitySubsystemsManifest.json`: Describes subsystems (input, display) to Unity XR framework.

* `Google.XR.Cardboard.asmdef`: Assembly definition to isolate Cardboard namespace.

---

### 🚀 Getting Started

#### 📦 Prerequisites

* Unity 2019.4.25f1 or later (tested)
* XR Management package (via Unity Package Manager)
* Cardboard SDK assets (textures, materials in `Resources/Cardboard/`)
* Android or iOS build support

#### 📥 Importing the Plugin

1. Clone this repo or import into an existing Unity project.
2. Enable **XR Plugin Management** (`Edit > Project Settings > XR Plug-in Management`).
3. Under **XR Plug-in Providers**, enable **Cardboard XR Plugin**.

---

### 🧠 Usage Guide

#### 🧭 Input Detection

Use the `Google.XR.Cardboard.Api` static class to detect input:

```csharp
if (Api.IsTriggerPressed) { /* Handle trigger tap */ }
if (Api.IsCloseButtonPressed) { /* Handle exit */ }
if (Api.IsGearButtonPressed) { /* Handle settings */ }
```

Also supports long-press detection with `Api.IsTriggerHeldPressed`.

### 📱 Device Configuration

* Automatically loads device parameters from saved QR code.
* Call `Api.ScanDeviceParams()` to launch QR code scanner.
* Use `Api.SaveDeviceParams(uri)` to save from URI manually.

### 🎯 Gaze Interaction (Reticle)

`CardboardReticlePointer.cs` draws a circular reticle that reacts to gaze-based events:

* Automatically expands over interactive GameObjects.
* Supports `OnPointerEnter`, `OnPointerExit`, and `OnPointerClick`.

Attach to a forward-facing GameObject (e.g., child of the main camera).

### 🧰 XR Initialization

Initialization happens via `XRLoader.cs`, automatically handling:

* Graphics API selection (OpenGL ES, Vulkan, Metal)
* Viewport orientation & safe area layout
* Display & input subsystem registration

---

## 🛠 iOS Library Compilation

To rebuild `GfxPluginCardboard.a`:

1. Follow [Google's iOS demo app guide](https://developers.google.com/cardboard/develop/ios/quickstart#download_and_build_the_demo_app) up to step 2.
2. Open `Cardboard.xcworkspace` in Xcode.
3. Build the `sdk` module for a `Generic iOS Device`.
4. Copy the resulting `.a` file into `Plugins/iOS/`.
5. Update dependencies in the `.meta` file (should include `IOSurface`, `OpenGLES`, `Metal`, etc.).

---

## 📦 XR Subsystems Manifest

Defined in `UnitySubsystemsManifest.json`:

```json
{
  "name": "Cardboard",
  "version": "1.28.0",
  "libraryName": "GfxPluginCardboard",
  "displays": [{ "id": "CardboardDisplay" }],
  "inputs": [{ "id": "CardboardInput" }]
}
```

---

## 🔐 License

Licensed under the Apache 2.0 License. See `LICENSE` file.
Google trademarks like "Google Cardboard" must be used according to [brand guidelines](https://www.google.com/permissions/).

---

## 📎 References

* [Google Cardboard for Unity Docs](https://developers.google.com/cardboard/develop/unity/quickstart)
* [Official GitHub SDK](https://github.com/googlevr/cardboard-xr-plugin)
* [API Reference](https://developers.google.com/cardboard/reference/unity)

---

## 👥 Contributing

While this repo may be a customized fork, bug reports and feature requests should go to the [official Cardboard SDK](https://github.com/googlevr/cardboard/issues).

---

## 📖 Chapter Dialogue Manager System

This system enables rich, interactive chapter-based storytelling using animated 3D characters, audio, prefab triggers, and emotion-driven expressions. It is built around Unity’s `MonoBehaviour`, `ScriptableObject`, and coroutine systems for runtime control and clean data management.

---

### 🗂 Structure Overview

| File                | Purpose                                                                                           |
| ------------------- | ------------------------------------------------------------------------------------------------- |
| `ChapterManager.cs` | Core driver: controls dialogue flow, prefab instantiation, character animations, and transitions. |
| `DialogueData.cs`   | ScriptableObject asset that stores all `DialogueLine`s and scene characters.                      |
| `DialogueLine.cs`   | Represents a single unit of dialogue (speaker, text, audio, animation, etc.).                     |

---

### 🧪 Setup Guide

#### Step 1: Prepare Dialogue Assets

* **Create a new dialogue asset**:

  * Right-click in `Assets/` → `Create > Dialogue > DialogueData`
  * Fill in the list of `DialogueLine` entries.
  * Define `sceneCharacters` (active characters in this scene).

#### Step 2: Assign Chapter Manager Components

In the Unity scene:

* Attach the `ChapterManager.cs` script to an empty GameObject.
* Drag in all required character models (Piranha, Iguana, Dragon, etc.) and link:

  * GameObject
  * Dialogue bubble (UI Canvas)
  * TextMeshPro component
  * SkinnedMeshRenderer (used for shapekeys)
* Set toggles like `usePiranha`, `useDragon` as needed.
* Assign the `DialogueData` asset and optional audio clips array.
* Assign any global prefabs to `globalPrefabEntries` if you want models to spawn during lines.

---

### 🧬 Runtime Behavior

#### 👆 Input Interaction

* **First click**: Hides chapter title, initializes dialogue, and begins first line.
* **Subsequent clicks**: Progresses to the next line of dialogue.

#### 🎭 Dialogue Display

For each `DialogueLine`:

* Plays speaker audio.
* Shows corresponding bubble and text.
* Applies:

  * Animation (`AnimationName`)
  * Shapekey (`ShapekeyName`)
* Spawns 3D prefabs if specified.

#### 🧠 Non-Speaking Character Reactions

If defined in `line.nonSpeakingCharacterActions`, each non-speaker can:

* Play animations (e.g., `Idle_B`, `Fear`, `Roll`)
* Trigger shapekeys (e.g., `Eyes_Blink`, `Eyes_Cry_1`)
* Otherwise, fallback to blinking with idle animations.

#### 💬 Emotive Animation System

* SkinnedMeshRenderers use named blendshapes from `ShapekeyName` enum.
* Animator transitions are called by name (must match animation clip state names).
* Characters blink periodically unless explicitly overridden during speaking.

---

### 🧩 Prefab Integration

Each `DialogueLine` can reference 3D prefabs via `prefabIndices`. These are:

* Defined in the `globalPrefabEntries` array in `ChapterManager`.
* Spawned in world space at a specific position and scale.
* Optionally spun for visual flair using `SpinPrefab()` coroutine.

```csharp
public class PrefabWithPosition {
    public GameObject prefab;
    public Vector3 position;
    public Vector3 scale;
}
```

---

### 🎬 Chapter Completion

Once the queue of dialogue lines is exhausted, the story ends automatically:

```csharp
SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
```

---

### 💡 Example Dialogue Line Definition

```csharp
new DialogueLine {
    speaker = Speaker.PIRANHA,
    text = "Watch out below!",
    audioClip = piranhaClip,
    animationName = AnimationName.Swim,
    shapekeyName = ShapekeyName.Eyes_Excited_1,
    prefabIndices = new List<int> { 0, 2 },
    nonSpeakingCharacterActions = new List<CharacterAction> {
        new CharacterAction {
            character = Speaker.DRAGON,
            animation = AnimationName.Fear,
            shapekey = ShapekeyName.Eyes_Squint
        }
    }
}
```

---

### 🔁 Going Back a Line (Optional)

Although not enabled by default, double-click support to step backward through dialogue is possible and implemented in some branches of the system using `dialogueHistory`.

