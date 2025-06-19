using UnityEngine;
using UnityEngine.Events;

[RequireComponent(typeof(Collider))]
public class ObjectUIButton : MonoBehaviour
{
    [Header("Visual Feedback")]
    public Material InactiveMaterial;
    public Material GazedAtMaterial;

    [Header("Button Behavior")]
    public UnityEvent onClick;

    private Renderer _myRenderer;

    void Start()
    {
        _myRenderer = GetComponent<Renderer>();
        SetMaterial(false);
    }

    public void OnPointerEnter()
    {
        SetMaterial(true); // Change to "hover" look when gazed at
    }

    public void OnPointerExit()
    {
        SetMaterial(false); // Change back to "inactive" look when gaze leaves
    }

    public void OnPointerClick()
    {
        Debug.Log($"{gameObject.name} clicked via trigger press!");
        onClick?.Invoke(); // Only called when user PRESSES trigger while gazing
    }

    private void SetMaterial(bool gazedAt)
    {
        if (_myRenderer != null && InactiveMaterial != null && GazedAtMaterial != null)
        {
            _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
        }
    }
}



// // using UnityEngine;
// // using UnityEngine.Events;

// // [RequireComponent(typeof(Collider))]
// // public class ObjectUIButton : MonoBehaviour
// // {
// //     [Header("Visual Feedback")]
// //     public Material InactiveMaterial;
// //     public Material GazedAtMaterial;

// //     [Header("Button Behavior")]
// //     public UnityEvent onClick;

// //     private Renderer _myRenderer;

// //     private bool isClicked = false;
// //     private float debounceTime = 0.5f; // 0.5 seconds delay
// //     private float lastClickTime = -1f;

// //     void Start()
// //     {
// //         _myRenderer = GetComponent<Renderer>();
// //         SetMaterial(false);
// //     }

// //     public void OnPointerEnter()
// //     {
// //         SetMaterial(true);
// //     }

// //     public void OnPointerExit()
// //     {
// //         SetMaterial(false);
// //     }

// //     public void OnPointerClick()
// //     {
// //         if (Time.time - lastClickTime < debounceTime)
// //             return;

// //         lastClickTime = Time.time;
// //         Debug.Log($"{gameObject.name} clicked!");
// //         onClick?.Invoke();
// //     }

// //     private void SetMaterial(bool gazedAt)
// //     {
// //         if (_myRenderer != null && InactiveMaterial != null && GazedAtMaterial != null)
// //         {
// //             _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
// //         }
// //     }
// // }

// using UnityEngine;
// using UnityEngine.Events;

// [RequireComponent(typeof(Collider))]
// public class ObjectUIButton : MonoBehaviour
// {
//     [Header("Visual Feedback")]
//     public Material InactiveMaterial;
//     public Material GazedAtMaterial;

//     [Header("Button Behavior")]
//     public UnityEvent onClick;

//     private Renderer _myRenderer;
//     private bool isGazedAt = false;
//     private float gazeTimer = 0f;
//     private float requiredGazeTime = 2f; // how long to look before clicking
//     private bool hasClicked = false;

//     void Start()
//     {
//         _myRenderer = GetComponent<Renderer>();
//         SetMaterial(false);
//     }

//     void Update()
//     {
//         if (isGazedAt && !hasClicked)
//         {
//             gazeTimer += Time.deltaTime;
//             if (gazeTimer >= requiredGazeTime)
//             {
//                 hasClicked = true;
//                 Debug.Log($"{gameObject.name} gaze-clicked!");
//                 onClick?.Invoke();
//             }
//         }
//         else
//         {
//             gazeTimer = 0f;
//         }
//     }

//     public void OnPointerEnter()
//     {
//         isGazedAt = true;
//         hasClicked = false;
//         SetMaterial(true);
//     }

//     public void OnPointerExit()
//     {
//         isGazedAt = false;
//         gazeTimer = 0f;
//         hasClicked = false;
//         SetMaterial(false); // 👈 Reset material when no longer gazed
//     }

//     private void SetMaterial(bool gazedAt)
//     {
//         if (_myRenderer != null && InactiveMaterial != null && GazedAtMaterial != null)
//         {
//             _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
//         }
//     }
// }
