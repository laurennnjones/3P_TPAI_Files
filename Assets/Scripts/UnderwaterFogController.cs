using UnityEngine;

[RequireComponent(typeof(AudioLowPassFilter), typeof(AudioSource))]
public class UnderwaterFogController : MonoBehaviour
{
    //public Transform waterPlane; // assign SM_Env_Water_Plane_01 in Inspector
    public Color underwaterFogColor = new Color(0.2f, 0.5f, 0.7f, 1f);
    public float underwaterFogDensity = 0.05f;

    public float normalCutoff = 22000f;
    public float underwaterCutoff = 500f;

    private Color originalFogColor;
    private float originalFogDensity;
    private FogMode originalFogMode;
    private bool originalFogEnabled;

    private bool isUnderwater = false;
    private AudioLowPassFilter lowPass;
    private AudioSource audioSource;

    public float oceanSurfaceY = 0f; // expose in Inspector

    void Start()
    {
        // Save original fog settings
        originalFogEnabled = RenderSettings.fog;
        originalFogColor = RenderSettings.fogColor;
        originalFogDensity = RenderSettings.fogDensity;
        originalFogMode = RenderSettings.fogMode;

        // Get audio components
        lowPass = GetComponent<AudioLowPassFilter>();
        audioSource = GetComponent<AudioSource>();

        if (audioSource != null)
        {
            audioSource.loop = true;
            audioSource.playOnAwake = false;
        }
    }

    void Update()
    {
        //if (waterPlane == null)
        //    return;

        float cameraY = Camera.main.transform.position.y;
        //float waterY = waterPlane.position.y;

        bool currentlyUnderwater = cameraY < oceanSurfaceY;

        if (currentlyUnderwater != isUnderwater)
        {
            isUnderwater = currentlyUnderwater;
            UpdateEnvironment(isUnderwater);
        }

        // Smooth fog transition
        if (RenderSettings.fog)
        {
            float targetDensity = isUnderwater ? underwaterFogDensity : originalFogDensity;
            RenderSettings.fogDensity = Mathf.Lerp(
                RenderSettings.fogDensity,
                targetDensity,
                Time.deltaTime * 2f
            );
        }
    }

    void UpdateEnvironment(bool underwater)
    {
        if (underwater)
        {
            // REMOVE fog changes here to avoid conflict with Post-Processing
            // Keep audio effect
            if (lowPass)
                lowPass.cutoffFrequency = underwaterCutoff;

            if (audioSource && !audioSource.isPlaying)
                audioSource.Play();
        }
        else
        {
            if (lowPass)
                lowPass.cutoffFrequency = normalCutoff;

            if (audioSource && audioSource.isPlaying)
                audioSource.Stop();
        }
    }

    public void Initialize()
    {
        // Save original fog settings
        originalFogEnabled = RenderSettings.fog;
        originalFogColor = RenderSettings.fogColor;
        originalFogDensity = RenderSettings.fogDensity;
        originalFogMode = RenderSettings.fogMode;

        // Get audio components
        lowPass = GetComponent<AudioLowPassFilter>();
        audioSource = GetComponent<AudioSource>();

        if (audioSource != null)
        {
            audioSource.loop = true;
            audioSource.playOnAwake = false;
        }
    }
}


// void UpdateEnvironment(bool underwater)
// {
//     if (underwater)
//     {
//         RenderSettings.fog = true;
//         RenderSettings.fogMode = FogMode.Linear;
//         RenderSettings.fogColor = underwaterFogColor;
//         RenderSettings.fogDensity = underwaterFogDensity;

//         if (lowPass)
//             lowPass.cutoffFrequency = underwaterCutoff;
//         if (audioSource && !audioSource.isPlaying)
//             audioSource.Play();
//     }
//     else
//     {
//         RenderSettings.fog = false; // ❗ Force fog OFF when above water
//         if (lowPass)
//             lowPass.cutoffFrequency = normalCutoff;
//         if (audioSource && audioSource.isPlaying)
//             audioSource.Stop();
//     }
// }
