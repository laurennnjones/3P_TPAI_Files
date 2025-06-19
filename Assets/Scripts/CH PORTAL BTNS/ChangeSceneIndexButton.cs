using TMPro;
using UnityEngine;
using UnityEngine.Events;

[RequireComponent(typeof(Collider))]
public class ChangeSceneIndexButton : ReticleInteractableBase
{
    public enum ButtonType
    {
        Increment,
        Decrement,
    }

    [Header("Button Type")]
    public ButtonType buttonType = ButtonType.Increment;

    [Header("Materials")]
    public Material InactiveMaterial;
    public Material GazedAtMaterial;

    [Header("Scene Management")]
    public GazeScenePortal portalToControl;

    [Min(1)]
    public int minSceneIndex = 1;
    public int maxSceneIndex = 10;

    [Header("UI Feedback")]
    public TextMeshProUGUI sceneNumberText;
    public UnityEvent onClick;

    private Renderer _myRenderer;
    private bool _clickInProgress = false;

    private void Start()
    {
        _myRenderer = GetComponent<Renderer>();
        SetMaterial(false);
        UpdateSceneText();
    }

    public override void OnPointerEnter()
    {
        GazeInteractionState.isLookingAtInteractive = true;
        SetMaterial(true);
    }

    public override void OnPointerExit()
    {
        GazeInteractionState.isLookingAtInteractive = false;
        SetMaterial(false);
        _clickInProgress = false;
    }

    public override void OnPointerClick()
    {
        if (_clickInProgress || !Google.XR.Cardboard.Api.IsTriggerHeldPressed)
            return;

        _clickInProgress = true;

        if (portalToControl != null)
        {
            int newIndex = portalToControl.sceneIndex;

            switch (buttonType)
            {
                case ButtonType.Increment:
                    newIndex++;
                    if (newIndex > maxSceneIndex)
                        newIndex = minSceneIndex;
                    break;
                case ButtonType.Decrement:
                    newIndex--;
                    if (newIndex < minSceneIndex)
                        newIndex = maxSceneIndex;
                    break;
            }

            portalToControl.sceneIndex = newIndex;
            UpdateSceneText();
            Debug.Log($"[SceneIndexButton] Scene index set to {newIndex}");
        }

        onClick?.Invoke();
    }

    private void SetMaterial(bool gazedAt)
    {
        if (_myRenderer && InactiveMaterial && GazedAtMaterial)
            _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
    }

    private void UpdateSceneText()
    {
        if (sceneNumberText && portalToControl)
            sceneNumberText.text = $"Chapter {portalToControl.sceneIndex}";
    }
}


// using TMPro;
// using UnityEngine;
// using UnityEngine.Events;

// [RequireComponent(typeof(Collider))]
// public class IncrementSceneIndexButton : MonoBehaviour
// {
//     public Material InactiveMaterial;
//     public Material GazedAtMaterial;

//     public GazeScenePortal portalToControl;
//     public int maxSceneIndex = 10;
//     public TextMeshProUGUI sceneNumberText;
//     public UnityEvent onClick;

//     private Renderer _myRenderer;

//     // NEW: click timing variables
//     private float lastClickTime = 0f;
//     private float clickCooldown = 0.15f;

//     void Start()
//     {
//         _myRenderer = GetComponent<Renderer>();
//         SetMaterial(false);
//         UpdateSceneText();
//     }

//     public void OnPointerEnter()
//     {
//         GazeInteractionState.isLookingAtInteractive = true;
//         SetMaterial(true); // or whatever highlight logic you have
//     }

//     public void OnPointerExit()
//     {
//         GazeInteractionState.isLookingAtInteractive = false;
//         SetMaterial(false); // or whatever unhighlight logic you have
//     }

//     public void OnPointerClick()
//     {
//         if (Time.time - lastClickTime < clickCooldown)
//             return; // ❌ Block multiple rapid clicks

//         lastClickTime = Time.time; // ✅ Reset timer

//         if (portalToControl != null)
//         {
//             portalToControl.sceneIndex++;
//             if (portalToControl.sceneIndex > maxSceneIndex)
//                 portalToControl.sceneIndex = 1;

//             Debug.Log($"Scene index incremented to {portalToControl.sceneIndex}");
//             UpdateSceneText();
//         }

//         onClick?.Invoke();
//     }

//     private void SetMaterial(bool gazedAt)
//     {
//         if (_myRenderer && InactiveMaterial && GazedAtMaterial)
//             _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
//     }

//     private void UpdateSceneText()
//     {
//         if (sceneNumberText && portalToControl)
//             sceneNumberText.text = $"Chapter {portalToControl.sceneIndex}";
//     }
// }

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
