using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class PlayerJumpController : MonoBehaviour
{
    public float hopHeight = 1f;
    public float hopDuration = 0.3f;
    public float gravity = 9.8f;
    public Transform respawnPoint;

    private CharacterController characterController;
    private bool isHopping = false;
    private Vector3 velocity;

    void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        if (!isHopping)
        {
            if (!characterController.isGrounded)
            {
                velocity.y -= gravity * Time.deltaTime;
                characterController.Move(velocity * Time.deltaTime);
            }
            else
            {
                velocity.y = -1f; // Small downward force to keep grounded
            }
        }
    }

    public void JumpTo(Vector3 targetPosition, Transform newParent = null)
    {
        if (!isHopping)
        {
            transform.SetParent(null); // Detach before jumping
            StartCoroutine(HopArc(targetPosition, newParent));
        }
    }

    System.Collections.IEnumerator HopArc(Vector3 target, Transform newParent)
    {
        isHopping = true;
        velocity = Vector3.zero;

        Vector3 start = transform.position;
        float elapsed = 0f;

        while (elapsed < hopDuration)
        {
            float t = elapsed / hopDuration;
            float arc = Mathf.Sin(t * Mathf.PI) * hopHeight;

            Vector3 nextPos = Vector3.Lerp(start, target, t) + Vector3.up * arc;
            Vector3 move = nextPos - transform.position;

            characterController.Move(move);
            elapsed += Time.deltaTime;
            yield return null;
        }

        // Final snap
        Vector3 finalMove = target - transform.position;
        characterController.Move(finalMove);

        if (newParent != null)
            transform.SetParent(newParent);

        isHopping = false;
    }

    public void Respawn()
    {
        transform.SetParent(null);
        characterController.enabled = false;
        transform.position = respawnPoint.position;
        characterController.enabled = true;
        velocity = Vector3.zero;
    }
}


//using UnityEngine;

//public class PlayerJumpController : MonoBehaviour
//{
//    public float hopHeight = 1f;
//    public float hopDuration = 0.3f;
//    public float gravity = 9.8f;
//    public Transform respawnPoint;

//    private bool isHopping = false;
//    private Vector3 velocity;

//    void Update()
//    {
//        if (!isHopping)
//        {
//            if (!IsGrounded())
//                ApplyGravity();
//            else
//                velocity.y = 0f;
//        }
//    }

//    public void JumpTo(Vector3 targetPosition, Transform newParent = null)
//    {
//        if (!isHopping)
//        {
//            // Detach from any previous parent
//            transform.SetParent(null);

//            // Start the hop animation
//            StartCoroutine(HopArc(targetPosition, newParent));
//        }
//    }

//    bool IsGrounded()
//    {
//        // Add a layer mask if needed
//        return Physics.Raycast(transform.position + Vector3.up * 0.1f, Vector3.down, 0.2f);
//    }

//    void ApplyGravity()
//    {
//        velocity.y -= gravity * Time.deltaTime;
//        transform.position += velocity * Time.deltaTime;

//        if (transform.position.y < -10f)
//            Respawn();
//    }

//    System.Collections.IEnumerator HopArc(Vector3 target, Transform newParent)
//    {
//        isHopping = true;
//        velocity = Vector3.zero;

//        Vector3 start = transform.position;
//        float elapsed = 0f;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float arc = Mathf.Sin(t * Mathf.PI) * hopHeight;
//            transform.position = Vector3.Lerp(start, target, t) + Vector3.up * arc;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        transform.position = target;

//        if (newParent != null)
//            transform.SetParent(newParent);

//        isHopping = false;
//    }

//    public void Respawn()
//    {
//        transform.SetParent(null);
//        transform.position = respawnPoint.position;
//        velocity = Vector3.zero;
//    }
//}


//using UnityEngine;

//public class GazeJumpController : MonoBehaviour
//{
//    public float hopHeight = 1f;
//    public float hopDuration = 0.3f;
//    public float gravity = 9.8f;
//    public float cameraYOffset = 1.2f;
//    public LayerMask platformLayer;
//    public Transform respawnPoint;

//    private bool isHopping = false;
//    private GameObject currentTarget;
//    private Vector3 velocity;

//    void Update()
//    {
//        if (isHopping)
//            return;

//        // Raycast straight down to check if standing on something
//        if (!IsGrounded())
//        {
//            ApplyGravity();
//        }
//        else
//        {
//            velocity.y = 0f;
//        }

//        // Detect gaze target
//        var reticle = FindObjectOfType<CardboardReticlePointer>();
//        if (reticle != null)
//        {
//            GameObject gazedObject = reticle.CurrentGazedObject;

//            if (gazedObject != currentTarget)
//            {
//                if (currentTarget != null)
//                    currentTarget.GetComponent<GazeTarget>()?.SetGazedAt(false);

//                currentTarget = gazedObject;
//                currentTarget?.GetComponent<GazeTarget>()?.SetGazedAt(true);
//            }
//        }

//        // Hop when trigger is pressed and gazing at a valid platform
//        if (Google.XR.Cardboard.Api.IsTriggerPressed && currentTarget != null)
//        {
//            Vector3 targetPos = currentTarget.transform.position + Vector3.up * 0.05f;

//            transform.SetParent(null); // detach first
//            StartCoroutine(HopArc(targetPos, currentTarget.transform));
//        }
//    }

//    bool IsGrounded()
//    {
//        return Physics.Raycast(transform.position + Vector3.up * 0.1f, Vector3.down, 0.2f, platformLayer);
//    }

//    void ApplyGravity()
//    {
//        velocity.y -= gravity * Time.deltaTime;
//        transform.position += velocity * Time.deltaTime;
//    }

//    System.Collections.IEnumerator HopArc(Vector3 target, Transform newParent)
//    {
//        isHopping = true;
//        velocity = Vector3.zero; // Cancel any vertical motion
//        Vector3 start = transform.position;
//        float elapsed = 0f;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float arc = Mathf.Sin(t * Mathf.PI) * hopHeight;
//            transform.position = Vector3.Lerp(start, target, t) + Vector3.up * arc;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        transform.position = target;
//        transform.SetParent(newParent); // Stick to platform
//        isHopping = false;
//    }

//    public void Respawn()
//    {
//        transform.SetParent(null);
//        transform.position = respawnPoint.position;
//        velocity = Vector3.zero;
//    }
//}



//using UnityEngine;

//public class SimpleFrogHopWithLandingCheck : MonoBehaviour
//{
//    public float hopDistance = 1.5f;        // Distance per hop
//    public float hopHeight = 1f;            // Height of the arc
//    public float hopDuration = 0.3f;        // Duration of the hop animation
//    public LayerMask groundLayer;           // Layer for valid landing ground

//    private bool isHopping = false;
//    private bool triggerHeldLastFrame = false;

//    void Update()
//    {
//        bool triggerPressed = Google.XR.Cardboard.Api.IsTriggerPressed;

//        // Only hop once per press, and only if not already mid-hop
//        if (triggerPressed && !triggerHeldLastFrame && !isHopping)
//        {
//            Vector3 forward = Camera.main.transform.forward;
//            forward.y = 0; // Keep it horizontal
//            forward.Normalize();

//            Vector3 horizontalTarget = transform.position + forward * hopDistance;
//            Vector3 rayOrigin = horizontalTarget + Vector3.up * 2f;

//            // Raycast down to detect ground
//            if (Physics.Raycast(rayOrigin, Vector3.down, out RaycastHit hit, 5f, groundLayer))
//            {
//                Vector3 landingPoint = hit.point + Vector3.up * 0.05f;
//                StartCoroutine(HopArc(landingPoint));
//            }
//            else
//            {
//                Debug.Log("🚨 No valid landing surface detected. Consider triggering fall or respawn here.");
//            }
//        }

//        triggerHeldLastFrame = triggerPressed;
//    }

//    // Handles the arc animation
//    System.Collections.IEnumerator HopArc(Vector3 target)
//    {
//        isHopping = true;

//        Vector3 start = transform.position;
//        float elapsed = 0f;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float height = Mathf.Sin(t * Mathf.PI) * hopHeight;
//            transform.position = Vector3.Lerp(start, target, t) + Vector3.up * height;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        transform.position = target; // Snap exactly to target
//        isHopping = false;
//    }
//}

