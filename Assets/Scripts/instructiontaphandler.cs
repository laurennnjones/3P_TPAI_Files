using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class InstructionTapHandler : MonoBehaviour
{
    private int instructIndex = 0;
    private TextMeshProUGUI instructText;

    [Header("Optional Components")]
    public GameObject menuGroup; // group of menu buttons
    public GameObject instructionCanvas; // the canvas or torus that holds instructions
    public GameObject startButton; // Assign this in the Inspector

    public GameObject player; // player object for enabling movement
    public UniversalFadeScreen fadeScreen; // optional fade screen
    public int returnHomeSceneIndex = 0;

    private bool canAdvance = true;
    public float clickCooldown = 0.5f; // Seconds between allowed clicks
    private bool hasFinishedInstructions = false;

    [TextArea]
    private string[] instructions = new string[]
    {
        "Welcome to the Piranha game!",
        "Press and hold the trigger to swim!",
        "Look around to steer your piranha in any direction.",
        "Explore the underwater world around you!",
        "Tag other piranhas by swimming into them!",
        "Watch them change from angry to happy!",
        "Tag as many happy piranhas as you can!",
        "Have fun exploring and making new friends!",
    };

    public void OnPointerClick()
    {
        if (!canAdvance || hasFinishedInstructions)
            return;

        canAdvance = false;
        StartCoroutine(AdvanceInstructionWithDelay());
    }

    private System.Collections.IEnumerator AdvanceInstructionWithDelay()
    {
        instructIndex++;

        if (instructIndex < instructions.Length)
        {
            ShowInstruction(instructIndex);
        }
        else
        {
            hasFinishedInstructions = true;

            InstructionUIManager.InstructionsAreVisible = false;

            if (instructText != null)
                instructText.gameObject.SetActive(false);

            if (menuGroup != null)
                menuGroup.SetActive(true);

            if (startButton != null)
                EventSystem.current.SetSelectedGameObject(startButton);

            yield break; // No cooldown needed after final step
        }

        yield return new WaitForSeconds(clickCooldown);
        canAdvance = true;
    }

    private void Start()
    {
        instructText = GetComponent<TextMeshProUGUI>();
        if (instructionCanvas != null)
            instructionCanvas.SetActive(true);

        ShowInstruction(0);
    }

    public void OnPointerEnter()
    {
        // Optional: You could add highlight code here if you want
    }

    public void OnPointerExit()
    {
        // Optional: Remove highlight here
    }

    private void ShowInstruction(int index)
    {
        if (instructText != null && index < instructions.Length)
            instructText.text = instructions[index];
    }

    public void ReturnHome()
    {
        if (fadeScreen != null)
            StartCoroutine(FadeAndReturnHome());
        else
            UnityEngine.SceneManagement.SceneManager.LoadScene(returnHomeSceneIndex);
    }

    private System.Collections.IEnumerator FadeAndReturnHome()
    {
        fadeScreen.FadeOut();
        yield return new WaitForSeconds(fadeScreen.fadeDuration);
        UnityEngine.SceneManagement.SceneManager.LoadScene(returnHomeSceneIndex);
    }
}
