using UnityEngine;

public class FacePlayer : MonoBehaviour
{
    [Tooltip("Optional override. If not set, will use Camera.main.")]
    public Transform playerCamera;

    [Tooltip("Lock Y axis to prevent tilting up/down.")]
    public bool lockYAxis = true;

    private void OnEnable()
    {
        // Assign the main camera if not already set
        if (playerCamera == null && Camera.main != null)
        {
            playerCamera = Camera.main.transform;
        }

        FaceNow();
    }

    private void FaceNow()
    {
        if (playerCamera == null)
            return;

        Vector3 direction = transform.position - playerCamera.position;

        if (lockYAxis)
            direction.y = 0;

        transform.rotation = Quaternion.LookRotation(direction);
    }
}


// public class FacePlayer : MonoBehaviour
// {
//     [Tooltip("Optional override. If not set, will use Camera.main.")]
//     public Transform playerCamera;

//     [Tooltip("Lock Y axis to prevent tilting up/down.")]
//     public bool lockYAxis = true;

//     [Tooltip("Only face player once on start. Uncheck to update every frame.")]
//     public bool faceOnce = true;

//     private void Start()
//     {
//         if (playerCamera == null && Camera.main != null)
//         {
//             playerCamera = Camera.main.transform;
//         }

//         if (faceOnce)
//         {
//             FaceNow();
//         }
//     }

//     void Update()
//     {
//         if (!faceOnce && playerCamera != null)
//         {
//             FaceNow();
//         }
//     }

//     public void FaceNow()
//     {
//         if (playerCamera == null)
//             return;

//         Vector3 direction = transform.position - playerCamera.position;

//         if (lockYAxis)
//             direction.y = 0;

//         transform.rotation = Quaternion.LookRotation(direction);
//     }
// }
