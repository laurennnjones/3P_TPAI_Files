using UnityEngine;

public class ResumeButton : MonoBehaviour
{
    public GameObject idleMenuGroup; // Drag the IdleMenuGroup here

    public void OnResumeClicked()
    {
        idleMenuGroup.SetActive(false);
    }
}
