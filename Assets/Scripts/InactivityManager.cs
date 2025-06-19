// using TMPro;
// using UnityEngine;
// using UnityEngine.SceneManagement;

// public class InactivityManager : MonoBehaviour
// {
//     public GameObject pauseCanvas; // assign your pause Canvas here
//     public float inactivityThreshold = 5f;

//     private float inactivityTimer = 0f;
//     private bool isPaused = false;

//     void Update()
//     {
//         // Don't run timer if instructions are still showing
//         if (InstructionUIManager.InstructionsAreVisible)
//             return;

//         if (Google.XR.Cardboard.Api.IsTriggerPressed)
//         {
//             inactivityTimer = 0f;

//             if (isPaused)
//             {
//                 ContinueGame();
//             }
//         }
//         else
//         {
//             inactivityTimer += Time.deltaTime;

//             if (inactivityTimer >= inactivityThreshold && !isPaused)
//             {
//                 ShowPauseCanvas();
//             }
//         }
//     }

//     private void ShowPauseCanvas()
//     {
//         pauseCanvas.SetActive(true);
//         isPaused = true;
//         Time.timeScale = 0f; // pause game time (optional)
//     }

//     public void ContinueGame()
//     {
//         pauseCanvas.SetActive(false);
//         isPaused = false;
//         inactivityTimer = 0f;
//         Time.timeScale = 1f; // resume game time (if paused)
//     }

//     public void ReturnHome()
//     {
//         Time.timeScale = 1f;
//         SceneManager.LoadScene(0);
//     }

//     public void RestartScene()
//     {
//         Time.timeScale = 1f;
//         SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
//     }
// }
