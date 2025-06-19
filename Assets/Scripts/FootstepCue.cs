using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class FootstepCue : MonoBehaviour
{
    public float rayDistance = 2f; // how far down to check for ground
    public LayerMask groundLayer;

    public AudioClip sandSound;
    public AudioClip waterSound;
    public AudioClip defaultSound;

    private AudioSource audioSource;
    private string lastSurface = "";

    void Start()
    {
        audioSource = GetComponent<AudioSource>();
        audioSource.playOnAwake = false;
    }

    void Update()
    {
        if (
            Physics.Raycast(
                transform.position,
                Vector3.down,
                out RaycastHit hit,
                rayDistance,
                groundLayer
            )
        )
        {
            string currentSurface = hit.collider.tag;

            if (currentSurface != lastSurface)
            {
                lastSurface = currentSurface;
                PlaySurfaceSound(currentSurface);
            }
        }
    }

    void PlaySurfaceSound(string surfaceTag)
    {
        AudioClip clipToPlay = defaultSound;

        switch (surfaceTag)
        {
            case "Sand":
                clipToPlay = sandSound;
                break;
            case "Water":
                clipToPlay = waterSound;
                break;
        }

        if (clipToPlay != null)
        {
            audioSource.PlayOneShot(clipToPlay);
        }
    }
}
