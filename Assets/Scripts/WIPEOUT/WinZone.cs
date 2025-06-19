using UnityEngine;

public class WinZone : MonoBehaviour
{
    public GameObject winCanvas; // World-space UI that says "You Win!"
    public GameObject navMenu; // Your restart/next options menu

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (winCanvas != null)
                winCanvas.SetActive(true);

            if (navMenu != null)
                navMenu.SetActive(true);

            Debug.Log("Player won!");
        }
    }
}
