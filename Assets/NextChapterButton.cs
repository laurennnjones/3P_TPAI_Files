// using TMPro;
// using UnityEngine;
// using UnityEngine.Events;

// [RequireComponent(typeof(Collider))]
// public class IncrementSceneIndexButton : MonoBehaviour
// {
//     [Header("Visual Feedback")]
//     public Material InactiveMaterial;
//     public Material GazedAtMaterial;

//     [Header("Scene Switching")]
//     public GazeScenePortal portalToControl;
//     public int maxSceneIndex = 3;
//     public TextMeshProUGUI sceneNumberText;

//     [Header("Button Behavior")]
//     public UnityEvent onClick;

//     private Renderer _myRenderer;

//     void Start()
//     {
//         _myRenderer = GetComponent<Renderer>();
//         SetMaterial(false);
//         UpdateSceneText(); // Initialize text display
//     }

//     public void OnPointerEnter()
//     {
//         SetMaterial(true);
//     }

//     public void OnPointerExit()
//     {
//         SetMaterial(false);
//     }

//     public void OnPointerClick()
//     {
//         if (portalToControl != null)
//         {
//             portalToControl.sceneIndex = (portalToControl.sceneIndex % maxSceneIndex) + 1;
//             Debug.Log($"Scene index incremented to {portalToControl.sceneIndex}");

//             UpdateSceneText();
//         }

//         onClick?.Invoke();
//     }

//     private void SetMaterial(bool gazedAt)
//     {
//         if (_myRenderer != null && InactiveMaterial != null && GazedAtMaterial != null)
//         {
//             _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
//         }
//     }

//     private void UpdateSceneText()
//     {
//         if (sceneNumberText != null && portalToControl != null)
//             sceneNumberText.text = $"Scene {portalToControl.sceneIndex}";
//     }
// }
