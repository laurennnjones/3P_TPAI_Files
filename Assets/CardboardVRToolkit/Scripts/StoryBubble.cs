
using UnityEngine;

public class StoryBubble : ReticleInteractableBase
{
    public GameObject bubble;
    public AudioSource audioSource;
    public AudioClip narration;

    private void Start()
    {
        if (bubble != null) bubble.SetActive(false);
    }

    public override void OnPointerEnter() => bubble?.SetActive(true);
    public override void OnPointerExit() => bubble?.SetActive(false);

    public override void OnPointerClick()
    {
        if (audioSource && narration)
        {
            audioSource.clip = narration;
            audioSource.Play();
        }
    }
}
