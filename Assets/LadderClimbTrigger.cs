using UnityEngine;
using Google.XR.Cardboard;

public class LadderClimbTrigger : MonoBehaviour
{
    public float climbHeight = 3f;
    public float climbDuration = 2f;

    private bool isClimbing = false;
    private Transform player;
    private Vector3 startPos;
    private Vector3 targetPos;
    private float climbTimer = 0f;

    void Update()
    {
        if (isClimbing && player != null)
        {
            climbTimer += Time.deltaTime;
            float t = Mathf.Clamp01(climbTimer / climbDuration);
            player.position = Vector3.Lerp(startPos, targetPos, t);

            if (t >= 1f)
            {
                isClimbing = false;
            }
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (isClimbing) return;

        if (other.CompareTag("Player") && Api.IsTriggerPressed)
        {
            player = other.transform;

            startPos = player.position;
            targetPos = startPos + Vector3.up * climbHeight;

            climbTimer = 0f;
            isClimbing = true;
        }
    }
}
