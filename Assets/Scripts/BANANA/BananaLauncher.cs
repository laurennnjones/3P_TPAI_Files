using Google.XR.Cardboard;
using UnityEngine;

public class BananaLauncher : MonoBehaviour
{
    [Header("Banana Launcher Settings")]
    public GameObject bananaPrefab;
    public Transform spawnPoint;
    public float launchForce = 15f;
    public float launchCooldown = 0.75f;

    private float lastLaunchTime = -Mathf.Infinity;

    void Update()
    {
        // Use global trigger input directly
        if (Api.IsTriggerPressed && Time.time - lastLaunchTime >= launchCooldown)
        {
            LaunchBanana();
            lastLaunchTime = Time.time;
        }
    }

    void LaunchBanana()
    {
        if (bananaPrefab == null || spawnPoint == null)
        {
            Debug.LogWarning("Banana prefab and spawn point must be assigned.");
            return;
        }

        GameObject banana = Instantiate(bananaPrefab, spawnPoint.position, spawnPoint.rotation);

        Rigidbody rb = banana.GetComponent<Rigidbody>();
        if (rb != null)
        {
            rb.AddForce(spawnPoint.forward * launchForce, ForceMode.Impulse);
        }
        else
        {
            Debug.LogWarning("Banana prefab missing Rigidbody.");
        }
    }
}

// using Google.XR.Cardboard; // Make sure the Cardboard package is installed
// using UnityEngine;

// public class BananaLauncher : MonoBehaviour
// {
//     [Header("Banana Launcher Settings")]
//     [Tooltip("The Banana prefab to launch. Must have a Rigidbody component.")]
//     public GameObject bananaPrefab;

//     [Tooltip(
//         "Transform representing the spawn point for bananas (usually a child of the CameraRig)."
//     )]
//     public Transform spawnPoint;

//     [Tooltip("Force (in impulse mode) applied to the banana when launched.")]
//     public float launchForce = 10f;

//     [Tooltip("Time (in seconds) between banana launches.")]
//     public float launchCooldown = 1f;

//     // Internal cooldown tracker.
//     private float lastLaunchTime = -Mathf.Infinity;

//     void Update()
//     {
//         // Check if the Cardboard trigger is pressed and the cooldown has elapsed.
//         if (
//             Google.XR.Cardboard.Api.IsTriggerPressed
//             && Time.time - lastLaunchTime >= launchCooldown
//         )
//         {
//             LaunchBanana();
//             lastLaunchTime = Time.time;
//         }
//     }

//     void LaunchBanana()
//     {
//         // Safety check for required assignments.
//         if (bananaPrefab == null || spawnPoint == null)
//         {
//             Debug.LogWarning("Banana prefab and spawn point must be assigned.");
//             return;
//         }

//         // Instantiate the banana at the spawn point's position and rotation.
//         GameObject banana = Instantiate(bananaPrefab, spawnPoint.position, spawnPoint.rotation);

//         // Apply an impulse force to the banana's Rigidbody in the forward direction.
//         Rigidbody rb = banana.GetComponent<Rigidbody>();
//         if (rb != null)
//         {
//             rb.AddForce(spawnPoint.forward * launchForce, ForceMode.Impulse);
//         }
//         else
//         {
//             Debug.LogWarning("The banana prefab does not have a Rigidbody component.");
//         }
//     }
// }
