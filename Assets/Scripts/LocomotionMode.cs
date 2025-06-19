using Google.XR.Cardboard; // Ensure Cardboard API is imported
using UnityEngine;

public enum LocomotionMode
{
    Teleportation,
    Smooth,
}

public class DualLocomotion : MonoBehaviour
{
    [Header("General Settings")]
    [Tooltip("Select the locomotion mode for the scene.")]
    public LocomotionMode locomotionMode = LocomotionMode.Teleportation;

    [Header("Teleportation Settings")]
    [Tooltip("Maximum distance allowed for teleportation.")]
    public float teleportMaxDistance = 20f;

    [Tooltip("Layer mask for valid teleport surfaces.")]
    public LayerMask teleportLayerMask;

    [Header("Smooth Locomotion Settings")]
    [Tooltip("Speed in meters per second.")]
    public float smoothSpeed = 2f;

    // Cached components
    private Transform cameraTransform;
    private CharacterController characterController;

    private float verticalVelocity = 0f;
    public float gravity = 9.81f;

    void Start()
    {
        // Get the main camera (assumed to be your Cardboard VR camera)
        cameraTransform = Camera.main.transform;

        // Try to use a CharacterController if present
        characterController = GetComponent<CharacterController>();

        if (characterController == null)
        {
            Debug.LogWarning(
                "No CharacterController found on "
                    + gameObject.name
                    + ". Smooth locomotion will use Transform translations instead."
            );
        }
    }

    void Update()
    {
        if (GazeInteractionState.isLookingAtInteractive)
            return;

        switch (locomotionMode)
        {
            case LocomotionMode.Teleportation:
                HandleTeleportation();
                break;

            case LocomotionMode.Smooth:
                HandleSmoothMovement();
                ApplyGravity(); // ← add this!
                break;
        }
    }

    /// <summary>
    /// Handles teleportation-based movement. When the trigger is pressed, a ray is cast
    /// from the camera forward to determine a valid teleport destination.
    /// </summary>
    void HandleTeleportation()
    {
        // Check for trigger press (fires once on press)
        if (Google.XR.Cardboard.Api.IsTriggerPressed)
        {
            // Start from the camera position and look forward
            Ray ray = new Ray(cameraTransform.position, cameraTransform.forward);
            if (Physics.Raycast(ray, out RaycastHit hit, teleportMaxDistance, teleportLayerMask))
            {
                // Teleport the player to the hit point.
                // Optionally, add fade-out/fade-in or other visual feedback here.
                transform.position = hit.point;
            }
        }
    }

    /// <summary>
    /// Handles smooth locomotion. While the trigger is pressed, move the player in the camera's direction.
    /// </summary>
    void HandleSmoothMovement()
    {
        // Continuous movement is applied while the trigger is held.
        if (Google.XR.Cardboard.Api.IsTriggerPressed)
        {
            Vector3 moveDirection = new Vector3(
                cameraTransform.forward.x,
                0f,
                cameraTransform.forward.z
            ).normalized;

            // Calculate movement amount.
            Vector3 movement = moveDirection * smoothSpeed * Time.deltaTime;

            // Use CharacterController if available for physics-based movement.
            if (characterController != null)
            {
                characterController.Move(movement);
            }
            else
            {
                // Otherwise, adjust the transform directly.
                transform.position += movement;
            }
        }
    }

    void ApplyGravity()
    {
        if (!characterController.isGrounded)
        {
            verticalVelocity -= gravity * Time.deltaTime;
        }
        else
        {
            verticalVelocity = -1f; // small force to stay grounded
        }

        Vector3 gravityMove = new Vector3(0f, verticalVelocity, 0f) * Time.deltaTime;
        characterController.Move(gravityMove);
    }
}

// using Google.XR.Cardboard;
// using UnityEngine;

// public enum LocomotionMode
// {
//     Teleportation,
//     Smooth,
// }

// [RequireComponent(typeof(CharacterController))]
// public class DualLocomotion : MonoBehaviour
// {
//     [Header("General Settings")]
//     public LocomotionMode locomotionMode = LocomotionMode.Smooth;

//     [Header("Teleportation Settings")]
//     public float teleportMaxDistance = 20f;
//     public LayerMask teleportLayerMask;

//     [Header("Smooth Locomotion Settings")]
//     public float smoothSpeed = 2f;

//     [Header("Jump Settings")]
//     public float jumpForce = 5f;
//     public float gravity = 9.81f;
//     public float doubleClickThreshold = 0.3f;

//     private Transform cameraTransform;
//     private CharacterController characterController;

//     private float lastTriggerTime = 0f;
//     private int triggerClickCount = 0;

//     private float verticalVelocity = 0f;

//     void Start()
//     {
//         cameraTransform = Camera.main.transform;
//         characterController = GetComponent<CharacterController>();
//     }

//     void Update()
//     {
//         switch (locomotionMode)
//         {
//             case LocomotionMode.Teleportation:
//                 HandleTeleportation();
//                 break;

//             case LocomotionMode.Smooth:
//                 HandleSmoothAndJump();
//                 break;
//         }
//     }

//     void HandleSmoothAndJump()
//     {
//         bool triggerHeld = Google.XR.Cardboard.Api.IsTriggerPressed;

//         // === Handle Jump Input ===
//         if (triggerHeld)
//         {
//             float now = Time.time;

//             if (now - lastTriggerTime < doubleClickThreshold)
//             {
//                 triggerClickCount++;

//                 if (triggerClickCount >= 2 && characterController.isGrounded)
//                 {
//                     verticalVelocity = jumpForce;
//                     triggerClickCount = 0;
//                 }
//             }
//             else
//             {
//                 triggerClickCount = 1;
//             }

//             lastTriggerTime = now;
//         }

//         // === Apply Gravity ===
//         if (characterController.isGrounded && verticalVelocity < 0)
//         {
//             verticalVelocity = -1f;
//         }
//         else
//         {
//             verticalVelocity -= gravity * Time.deltaTime;
//         }

//         // === Calculate Movement ===
//         Vector3 horizontal = Vector3.zero;
//         if (triggerHeld)
//         {
//             Vector3 camForward = cameraTransform.forward;
//             camForward.y = 0;
//             horizontal = camForward.normalized * smoothSpeed * Time.deltaTime;
//         }

//         Vector3 vertical = new Vector3(0f, verticalVelocity, 0f) * Time.deltaTime;

//         // === Move ===
//         characterController.Move(horizontal + vertical);
//     }

//     void HandleTeleportation()
//     {
//         if (Google.XR.Cardboard.Api.IsTriggerPressed)
//         {
//             Ray ray = new Ray(cameraTransform.position, cameraTransform.forward);
//             if (Physics.Raycast(ray, out RaycastHit hit, teleportMaxDistance, teleportLayerMask))
//             {
//                 transform.position = hit.point;
//             }
//         }
//     }
// }
