// using System.Collections;
// using UnityEngine;
// using UnityEngine.SceneManagement;

// /// <summary>
// /// Controls target objects behaviour.
// /// </summary>
// public class ObjectControllerSceneChanger : MonoBehaviour
// {
//     /// <summary>
//     /// The material to use when this object is inactive (not being gazed at).
//     /// </summary>
//     public Material InactiveMaterial;

//     /// <summary>
//     /// The material to use when this object is active (gazed at).
//     /// </summary>
//     public Material GazedAtMaterial;

//      // New: Scene index to load on click
//     [Tooltip("Index of the scene to load when this object is clicked.")]
//     public int SceneIndexToLoad = 1;

//     private Renderer _myRenderer;

//     /// <summary>
//     /// Start is called before the first frame update.
//     /// </summary>
//     public void Start()
//     {
//         _myRenderer = GetComponent<Renderer>();
//         SetMaterial(false);
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it starts gazing at this GameObject.
//     /// </summary>
//     public void OnPointerEnter()
//     {
//         SetMaterial(true);
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it stops gazing at this GameObject.
//     /// </summary>
//     public void OnPointerExit()
//     {
//         SetMaterial(false);
//     }

//     /// <summary>
//     /// This method is called by the Main Camera when it is gazing at this GameObject and the screen
//     /// is touched.
//     /// </summary>
//     public void OnPointerClick()
//     {
//         ChangeScene();
//     }

//   private void ChangeScene()
// {
//     if (SceneTransitionManager.singleton != null)
//     {
//         SceneTransitionManager.singleton.GoToScene(SceneIndexToLoad);
//     }
//     else
//     {
//         Debug.LogWarning("SceneTransitionManager singleton is not found in the scene.");
//     }
// }


//     /// <summary>
//     /// Sets this instance's material according to gazedAt status.
//     /// </summary>
//     ///
//     /// <param name="gazedAt">
//     /// Value `true` if this object is being gazed at, `false` otherwise.
//     /// </param>
//     private void SetMaterial(bool gazedAt)
//     {
//         if (InactiveMaterial != null && GazedAtMaterial != null)
//         {
//             _myRenderer.material = gazedAt ? GazedAtMaterial : InactiveMaterial;
//         }
//     }
// }