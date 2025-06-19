using UnityEngine;

public class GlassPlatform : JumpTarget
{
    public float breakDelay = 2f;
    private bool isBreaking = false;

    public GameObject shatteredVersion; // Optional: visual FX when it breaks

    public override void OnPointerClick()
    {
        base.OnPointerClick();

        if (!isBreaking)
        {
            isBreaking = true;
            Invoke(nameof(Break), breakDelay);
        }
    }

    private void Break()
    {
        // Spawn shattered VFX if available
        if (shatteredVersion != null)
        {
            Instantiate(shatteredVersion, transform.position, transform.rotation);
        }

        // Hide or destroy platform
        gameObject.SetActive(false); // disables the object
        // OR Destroy(gameObject); // use this if you don’t need to reuse the platform
    }
}
