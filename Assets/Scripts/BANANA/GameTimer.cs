using TMPro;
using UnityEngine;

public class GameTimer : MonoBehaviour
{
    public float gameDuration = 60f; // Game lasts 60 seconds
    private float timeRemaining;

    public TextMeshProUGUI timerText;
    public GameObject endGamePanel; // UI panel to show when the game ends

    private bool isGameActive = true;

    void Start()
    {
        timeRemaining = gameDuration;
        if (endGamePanel != null)
            endGamePanel.SetActive(false);
    }

    void Update()
    {
        if (!isGameActive)
            return;

        timeRemaining -= Time.deltaTime;
        if (timeRemaining <= 0)
        {
            EndGame();
        }
        UpdateTimerUI();
    }

    void UpdateTimerUI()
    {
        if (timerText != null)
        {
            timerText.text = $"Time: {Mathf.Ceil(timeRemaining)}s";
        }
    }

    void EndGame()
    {
        isGameActive = false;
        timeRemaining = 0;
        UpdateTimerUI();

        if (endGamePanel != null)
            endGamePanel.SetActive(true);

        // You could also disable BananaLauncher here if you want
        BananaLauncher launcher = FindObjectOfType<BananaLauncher>();
        if (launcher != null)
            launcher.enabled = false;
    }
}
