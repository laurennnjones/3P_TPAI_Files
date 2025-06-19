using TMPro;
using UnityEngine;

public class ProgressTracker : MonoBehaviour
{
    public float unitsToFeet = 3f; // 1 Unity unit = 3 feet
    private float maxZThisRun;
    private float previousBestFeet;

    void Start()
    {
        previousBestFeet = PlayerPrefs.GetFloat("BestDistanceFeet", 0f);
        maxZThisRun = transform.position.z;
    }

    void Update()
    {
        maxZThisRun = Mathf.Max(maxZThisRun, transform.position.z);
    }

public void EndRun(System.Action<string> setFeedback)
{
    float distanceFeet = (maxZThisRun - StartingZ()) * unitsToFeet;

    if (distanceFeet > previousBestFeet)
    {
        float improvement = distanceFeet - previousBestFeet;
        setFeedback?.Invoke($"🎉 New record! You went {Mathf.RoundToInt(improvement)} feet farther!");
        PlayerPrefs.SetFloat("BestDistanceFeet", distanceFeet);
        PlayerPrefs.Save();
    }
    else
    {
        float diff = Mathf.RoundToInt(previousBestFeet - distanceFeet);
        setFeedback?.Invoke($"Nice try! You were just {diff} feet away from your best!");
    }
}


    private float StartingZ()
    {
        return 0f; // Adjust if player doesn’t start at Z=0
    }
}
