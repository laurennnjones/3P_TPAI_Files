using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class InstructionUIManager : MonoBehaviour
{
    public static bool InstructionsAreVisible = true;

    [Header("Camera Effects")]
    public GameObject mainCamera; // Assign the Main Camera in Inspector

    [Header("Navigation")]
    public int returnHomeSceneIndex = 0;
    public GameObject player; // Optional: to enable movement
    public UniversalFadeScreen fadeScreen; // Optional fade support

    [Header("Instructions + Menu")]
    public GameObject menuGroup; // drag your "Menu" object into this in the Inspector
    public GameObject instructionCanvas;
    private CanvasGroup instructionGroup;

    public TextMeshProUGUI instructText;

    void Start()
    {
        instructionGroup = instructionCanvas.GetComponent<CanvasGroup>();
        instructionGroup.alpha = 1f;
        instructionGroup.interactable = true;
        instructionGroup.blocksRaycasts = true;

        instructionCanvas.SetActive(true);
        InstructionsAreVisible = true;
        if (mainCamera != null)
        {
            var fog = mainCamera.GetComponent<UnderwaterFogController>();
            if (fog != null)
                fog.enabled = false;
        }
    }

    public void ReturnHome()
    {
        if (fadeScreen != null)
            StartCoroutine(FadeAndReturnHome());
        else
            SceneManager.LoadScene(returnHomeSceneIndex);
    }

    public void SkipAndStart()
    {
        StartGame();
    }

    private void StartGame()
    {
        InstructionsAreVisible = false;
        StartCoroutine(FadeOutInstructionCanvas());

        if (menuGroup != null)
            menuGroup.SetActive(false); // Hide Menu and its children

        GameObject.Find("CardboardReticlePointer").SetActive(true); // show gaze reticle

        if (mainCamera != null)
        {
            var fog = mainCamera.GetComponent<UnderwaterFogController>();
            if (fog != null)
            {
                fog.enabled = true;
                fog.Initialize(); // <-- Force the init logic again
            }
        }

        if (player != null)
        {
            var controller = player.GetComponent<CardboardFishController>();
            if (controller != null)
                controller.EnableMovement();
        }
    }

    private System.Collections.IEnumerator FadeAndReturnHome()
    {
        fadeScreen.FadeOut();
        yield return new WaitForSeconds(fadeScreen.fadeDuration);
        SceneManager.LoadScene(returnHomeSceneIndex);
    }

    private System.Collections.IEnumerator FadeOutInstructionCanvas()
    {
        float duration = 1f; // seconds
        float startAlpha = instructionGroup.alpha;
        float elapsed = 0f;

        instructionGroup.interactable = false;
        instructionGroup.blocksRaycasts = false;

        while (elapsed < duration)
        {
            elapsed += Time.deltaTime;
            float alpha = Mathf.Lerp(startAlpha, 0f, elapsed / duration);
            instructionGroup.alpha = alpha;
            yield return null;
        }

        instructionGroup.alpha = 0f;
        instructionCanvas.SetActive(false);
    }
}
