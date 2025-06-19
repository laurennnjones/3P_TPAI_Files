using Google.XR.Cardboard; // Cardboard API
using UnityEngine;

public class CardboardFishController : MonoBehaviour
{
    public GameObject instructionCanvas;

    [Header("Movement Settings")]
    public float maxSpeed = 5f;
    public float acceleration = 2f;
    public float deceleration = 2f;
    public float turnSpeed = 2f;

    private bool movementEnabled = false;
    private float currentSpeed = 0f;
    private Rigidbody rb;
    private Transform cameraTransform;
    private float surfaceY;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.isKinematic = true; // Freeze position at start
        cameraTransform = Camera.main.transform;

        // Clamp reference
        var oceanObj = GameObject.Find("Ocean_Collider");
        if (oceanObj != null)
            surfaceY = oceanObj.GetComponent<Collider>().bounds.max.y;
        else
            Debug.LogWarning("Ocean_Collider not found! Fish will not be clamped.");
    }

    // void Start()
    // {
    //     rb = GetComponent<Rigidbody>();
    //     rb.isKinematic = true;

    //     cameraTransform = Camera.main.transform;

    //     // Find your ocean surface by name (must match)
    //     var oceanObj = GameObject.Find("Ocean_Collider");
    //     if (oceanObj != null)
    //         surfaceY = oceanObj.GetComponent<Collider>().bounds.max.y;
    //     else
    //         Debug.LogWarning("Ocean_Collider not found! Fish will not be clamped.");

    //     currentSpeed = 0f;
    // }

    void Update()
    {
        // ✅ Don't move the fish if movement isn't enabled
        if (!movementEnabled)
            return;

        // --- Accelerate or decelerate ---
        if (Api.IsTriggerPressed)
            currentSpeed += acceleration * Time.deltaTime;
        else
            currentSpeed -= deceleration * Time.deltaTime;

        currentSpeed = Mathf.Clamp(currentSpeed, 0f, maxSpeed);

        // --- Rotate fish toward camera yaw ---
        float camYaw = cameraTransform.eulerAngles.y;
        float fishYaw = transform.eulerAngles.y;
        float deltaYaw = Mathf.DeltaAngle(fishYaw, camYaw);
        float turnAmt = turnSpeed * deltaYaw * Time.deltaTime;
        transform.Rotate(0f, turnAmt, 0f);

        // --- Swim forward ---
        Vector3 camDir = cameraTransform.forward.normalized;
        Vector3 movement = camDir * currentSpeed * Time.deltaTime;
        Vector3 target = rb.position + movement;

        target.y = Mathf.Min(target.y, surfaceY - 0.01f);
        rb.MovePosition(target);
    }

    // void Update()
    // {
    //     // Only accelerate/decelerate once we’ve clicked
    //     if (movementEnabled)
    //     {
    //         if (Api.IsTriggerPressed)
    //             currentSpeed += acceleration * Time.deltaTime;
    //         else
    //             currentSpeed -= deceleration * Time.deltaTime;

    //         currentSpeed = Mathf.Clamp(currentSpeed, 0f, maxSpeed);
    //     }

    //     // --- YAW to match head turn ---
    //     float camYaw = cameraTransform.eulerAngles.y;
    //     float fishYaw = transform.eulerAngles.y;
    //     float deltaYaw = Mathf.DeltaAngle(fishYaw, camYaw);
    //     float turnAmt = turnSpeed * deltaYaw * Time.deltaTime;
    //     transform.Rotate(0f, turnAmt, 0f);

    //     if (movementEnabled)
    //     {
    //         // --- MOVE along camera’s forward vector ---
    //         Vector3 camDir = cameraTransform.forward.normalized;
    //         Vector3 movement = camDir * currentSpeed * Time.deltaTime;
    //         Vector3 target = rb.position + movement;

    //         // Clamp so fish never exits above the water
    //         target.y = Mathf.Min(target.y, surfaceY - 0.01f);

    //         rb.MovePosition(target);
    //     }
    // }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Obstacle"))
        {
            currentSpeed = 0f;
            Debug.Log("Fish collided with obstacle.");
        }
    }

    public void EnableMovement()
    {
        movementEnabled = true;
        rb.isKinematic = false; // unfreeze for motion
        if (instructionCanvas != null)
            instructionCanvas.SetActive(false);
    }
}



// void Start()
// {
//     rb = GetComponent<Rigidbody>();
//      // Fish is stationary until first trigger press is recognized.
//     currentSpeed = 0f;
// }

// using Google.XR.Cardboard;
// using UnityEngine;

// public class CardboardFishController : MonoBehaviour
// {
//     [Header("Movement Settings")]
//     [Tooltip("Maximum forward speed in meters per second.")]
//     public float maxSpeed = 5f;

//     [Tooltip("Acceleration rate in meters per second squared.")]
//     public float acceleration = 2f;

//     [Tooltip("Deceleration rate when trigger is released.")]
//     public float deceleration = 2f;

//     [Tooltip("Turning speed multiplier (degrees/second per degree difference).")]
//     public float turnSpeed = 2f;

//     [Header("References")]
//     [Tooltip("LayerMask for the ocean surface collider. Assign your ocean's surface layer here.")]
//     public LayerMask oceanSurfaceMask;

//     // Prevent movement until the user first presses the trigger
//     private bool movementEnabled = false;

//     // Current forward speed of the fish
//     private float currentSpeed = 0f;
//     private Rigidbody rb;

//     void Start()
//     {
//         rb = GetComponent<Rigidbody>();
//         currentSpeed = 0f; // Fish is stationary until the user presses trigger
//     }

//     void Update()
//     {
//         // 1. Enable movement upon first trigger press
//         if (!movementEnabled && Google.XR.Cardboard.Api.IsTriggerPressed)
//         {
//             movementEnabled = true;
//         }

//         // 2. Acceleration/Deceleration
//         if (movementEnabled)
//         {
//             if (Google.XR.Cardboard.Api.IsTriggerPressed)
//             {
//                 currentSpeed += acceleration * Time.deltaTime;
//             }
//             else
//             {
//                 currentSpeed -= deceleration * Time.deltaTime;
//             }
//             currentSpeed = Mathf.Clamp(currentSpeed, 0f, maxSpeed);
//         }

//         // 3. Head-based Steering (Yaw only)
//         float cameraYaw = Camera.main.transform.eulerAngles.y;
//         float fishYaw = transform.eulerAngles.y;
//         float deltaYaw = Mathf.DeltaAngle(fishYaw, cameraYaw);
//         float turnAmount = turnSpeed * deltaYaw * Time.deltaTime;
//         transform.Rotate(0f, turnAmount, 0f);

//         // 4. Attempt Movement
//         Vector3 oldPos = rb.position;
//         Vector3 forwardMovement = transform.forward * currentSpeed * Time.deltaTime;
//         Vector3 newPos = oldPos + forwardMovement;

//         // 5. Check if we cross the ocean surface collider
//         // We do a linecast from oldPos to newPos, and if we hit the collider, clamp the position
//         if (Physics.Linecast(oldPos, newPos, out RaycastHit hit, oceanSurfaceMask))
//         {
//             // We intersected the ocean collider, so place the fish just below the collision point
//             newPos = hit.point - hit.normal * 0.01f;
//         }

//         // 6. Move the fish to the final position
//         rb.MovePosition(newPos);
//     }

//     void OnCollisionEnter(Collision collision)
//     {
//         if (collision.gameObject.CompareTag("Obstacle"))
//         {
//             currentSpeed = 0;
//             Debug.Log("Fish collided with an obstacle!");
//         }
//     }
// }

// separeate

//     void Update()
//     {
//   // Check for the very first trigger press to enable movement.
//         if (!movementEnabled && Google.XR.Cardboard.Api.IsTriggerPressed)
//         {
//             movementEnabled = true;
//         }

//         // If movement is enabled, do the standard accelerate/decelerate logic.
//         if (movementEnabled)
//         {

//         // --- ACCELERATION/DECELERATION ---
//         if (Google.XR.Cardboard.Api.IsTriggerPressed)
//         {
//             currentSpeed += acceleration * Time.deltaTime;
//         }
//         else
//         {
//             currentSpeed -= deceleration * Time.deltaTime;
//         }
//         currentSpeed = Mathf.Clamp(currentSpeed, 0f, maxSpeed);
//         }

//         // --- STEERING VIA HEAD ORIENTATION ---
//         // Use the Cardboard VR camera's yaw to determine desired turning direction.
//         float cameraYaw = Camera.main.transform.eulerAngles.y;
//         float fishYaw = transform.eulerAngles.y;
//         // Calculate the shortest angle difference.
//         float deltaYaw = Mathf.DeltaAngle(fishYaw, cameraYaw);
//         // Apply a rotation based on the difference.
//         float turnAmount = turnSpeed * deltaYaw * Time.deltaTime;
//         transform.Rotate(0f, turnAmount, 0f);

//         // --- MOVEMENT ---
//         Vector3 forwardMovement = transform.forward * currentSpeed * Time.deltaTime;
//         rb.MovePosition(rb.position + forwardMovement);
//     }
