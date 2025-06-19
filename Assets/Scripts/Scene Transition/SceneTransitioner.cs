// using System.Collections;
// using UnityEngine;
// using UnityEngine.SceneManagement;

// public class SceneTransitioner : MonoBehaviour
// {
//     [Tooltip("Index of the scene to load when this object is clicked.")]
//     public int SceneIndexToLoad = 1;

//     [Header("Optional Gaze Materials")]
//         /// <summary>
//     /// The material to use when this object is inactive (not being gazed at).
//     /// </summary>
//     public Material InactiveMaterial;

//     /// <summary>
//     /// The material to use when this object is active (gazed at).
//     /// </summary>
//     public Material GazedAtMaterial;


//     private Renderer _myRenderer;

//     /// <summary>
//     /// Start is called before the first frame update.
//     /// </summary>
//     void Start()
//     {
//         _myRenderer = GetComponent<Renderer>();

//         // Optional: Only set if both materials and a renderer are available
//         if (_myRenderer != null && InactiveMaterial != null && GazedAtMaterial != null)
//         {
//             _myRenderer.material = InactiveMaterial;
//         }
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it starts gazing at this GameObject.
//     /// </summary>
//     public void OnPointerEnter()
//     {
//         if (_myRenderer != null && GazedAtMaterial != null)
//         {
//             _myRenderer.material = GazedAtMaterial;
//         }
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it stops gazing at this GameObject.
//     /// </summary>
//     public void OnPointerExit()
//     {
//         if (_myRenderer != null && InactiveMaterial != null)
//         {
//             _myRenderer.material = InactiveMaterial;
//         }
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it is gazing at this GameObject and the screen
//     /// is touched.
//     /// </summary>
//     public void OnPointerClick()
//     {
//         ChangeScene();
//     }

//     private void ChangeScene()
// {
//     if (SceneIndexToLoad < 0 || SceneIndexToLoad >= SceneManager.sceneCountInBuildSettings)
//     {
//         Debug.LogError($"Scene index {SceneIndexToLoad} is out of range! Total scenes: {SceneManager.sceneCountInBuildSettings}");
//         return; // use return instead of yield break
//     }

//     if (SceneTransitionManager.singleton != null)
//     {
//         SceneTransitionManager.singleton.GoToScene(SceneIndexToLoad);
//     }
//     else
//     {
//         Debug.LogWarning("SceneTransitionManager singleton is not found in the scene.");
//     }
// }

// }
