using Google.XR.Cardboard;
using UnityEngine;

public class LaunchPad : MonoBehaviour
{
    public Transform player; // Reference to the fish or VR player object
    public Transform launchTarget; // Where the arc ends
    public float arcHeight = 3f; // Peak height of the arc
    public float launchDelay = 0.2f; // Optional delay after teleport

    private bool launched = false;

    void Update()
    {
        if (launched || player == null || launchTarget == null)
            return;

        if (Api.IsTriggerPressed)
        {
            float distance = Vector3.Distance(Camera.main.transform.position, transform.position);
            if (distance < 2f) // Gaze click range (adjustable)
            {
                StartCoroutine(TeleportAndLaunch());
            }
        }
    }

    System.Collections.IEnumerator TeleportAndLaunch()
    {
        launched = true;

        // Teleport player to this object's position
        player.position = transform.position;

        yield return new WaitForSeconds(launchDelay);

        // Launch with arc
        Vector3 startPos = player.position;
        Vector3 endPos = launchTarget.position;

        Vector3 displacement = endPos - startPos;
        Vector3 horizontal = new Vector3(displacement.x, 0, displacement.z);
        float time =
            Mathf.Sqrt(-2 * arcHeight / Physics.gravity.y)
            + Mathf.Sqrt(2 * (displacement.y - arcHeight) / Physics.gravity.y);
        Vector3 velocityY = Vector3.up * Mathf.Sqrt(-2 * Physics.gravity.y * arcHeight);
        Vector3 velocityXZ = horizontal / time;

        Vector3 launchVelocity = velocityXZ + velocityY;

        Rigidbody rb = player.GetComponent<Rigidbody>();
        rb.isKinematic = false;
        rb.velocity = launchVelocity;
    }
}
