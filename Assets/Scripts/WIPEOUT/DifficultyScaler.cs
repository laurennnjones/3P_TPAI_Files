using UnityEngine;

public class DifficultyScaler : MonoBehaviour
{
    public PlatformLaneController[] allLanes;
    public Transform player;
    public float[] difficultyZThresholds = { 10f, 20f, 30f };
    private int currentLevel = 0;

    void Update()
    {
        if (
            currentLevel < difficultyZThresholds.Length
            && player.position.z > difficultyZThresholds[currentLevel]
        )
        {
            foreach (var lane in allLanes)
            {
                lane.IncreaseDifficulty(1.2f, 0.85f);
            }

            currentLevel++;
        }
    }
}
