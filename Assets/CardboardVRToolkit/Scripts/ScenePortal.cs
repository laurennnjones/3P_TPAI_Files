// using UnityEngine;
// using UnityEngine.SceneManagement;

// public class ScenePortal : ReticleInteractableBase
// {
//     public int sceneIndex = 1;
//     public UniversalFadeScreen fadeScreen;

//     public override void OnPointerClick()
//     {
//         if (fadeScreen != null)
//             StartCoroutine(FadeThenLoad());
//         else
//             SceneManager.LoadScene(sceneIndex);
//     }

//     private System.Collections.IEnumerator FadeThenLoad()
//     {
//         fadeScreen.FadeOut();
//         yield return new WaitForSeconds(fadeScreen.fadeDuration);
//         SceneManager.LoadScene(sceneIndex);
//     }
// }
