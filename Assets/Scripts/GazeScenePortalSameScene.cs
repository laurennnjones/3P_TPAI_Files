// using UnityEngine;
// using UnityEngine.SceneManagement;

// public class GazeScenePortalSameScene : ReticleInteractableBase
// {
//     public UniversalFadeScreen fadeScreen;

//     [Header("Material Swap (Optional)")]
//     public Material inactiveMaterial;
//     public Material gazedAtMaterial;

//     [Header("Gaze Tint Settings")]
//     public bool enableTint = false;
//     public Color gazeTintColor = new Color(1f, 1f, 0.5f, 1f); // yellow
//     public float gazeTintIntensity = 0.5f;

//     [Header("Distance Settings")]
//     public bool useDistanceCheck = true;
//     public Transform playerTransform;
//     public float interactionDistance = 3f;

//     private Renderer doorRenderer;
//     private Color originalColor;

//     private void Start()
//     {
//         doorRenderer = GetComponent<Renderer>();
//         if (doorRenderer != null)
//         {
//             if (inactiveMaterial != null)
//                 doorRenderer.material = inactiveMaterial;

//             if (doorRenderer.material.HasProperty("_Color"))
//                 originalColor = doorRenderer.material.color;
//         }
//     }

//     public override void OnPointerEnter()
//     {
//         if (useDistanceCheck && !IsPlayerCloseEnough())
//             return;

//         if (doorRenderer == null)
//             return;

//         if (gazedAtMaterial != null)
//         {
//             doorRenderer.material = gazedAtMaterial;
//         }
//         else if (enableTint && doorRenderer.material.HasProperty("_Color"))
//         {
//             Color tinted = Color.Lerp(originalColor, gazeTintColor, gazeTintIntensity);
//             doorRenderer.material.color = tinted;
//         }
//     }

//     public override void OnPointerExit()
//     {
//         if (doorRenderer == null)
//             return;

//         if (inactiveMaterial != null)
//         {
//             doorRenderer.material = inactiveMaterial;
//         }
//         else if (enableTint && doorRenderer.material.HasProperty("_Color"))
//         {
//             doorRenderer.material.color = originalColor;
//         }
//     }

//     public override void OnPointerClick()
//     {
//         if (!Google.XR.Cardboard.Api.IsTriggerPressed)
//             return;

//         if (useDistanceCheck && !IsPlayerCloseEnough())
//             return;

//         if (fadeScreen != null)
//             StartCoroutine(FadeAndReloadScene());
//         else
//             SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
//     }

//     private bool IsPlayerCloseEnough()
//     {
//         if (playerTransform == null)
//         {
//             Debug.LogWarning("Player Transform not assigned on GazeScenePortal.");
//             return false;
//         }

//         float distance = Vector3.Distance(playerTransform.position, transform.position);
//         return distance <= interactionDistance;
//     }

//     private System.Collections.IEnumerator FadeAndReloadScene()
//     {
//         if (fadeScreen != null)
//         {
//             fadeScreen.FadeOut();
//             yield return new WaitForSeconds(fadeScreen.fadeDuration);
//         }

//         SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
//     }
// }
