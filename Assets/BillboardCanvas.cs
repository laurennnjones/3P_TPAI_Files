using UnityEngine;

public class BillboardCanvas : MonoBehaviour
{
    public bool smoothRotation = true;
    public float rotationSpeed = 5f;

    private Transform cameraTransform;

    void Start()
    {
        cameraTransform = Camera.main.transform;
    }

    void LateUpdate()
    {
        Vector3 direction = cameraTransform.position - transform.position;

        // Optional: Keep it horizontal (no tilt)
        direction.y = 0f;

        Quaternion targetRotation = Quaternion.LookRotation(-direction);

        if (smoothRotation)
        {
            transform.rotation = Quaternion.Slerp(
                transform.rotation,
                targetRotation,
                rotationSpeed * Time.deltaTime
            );
        }
        else
        {
            transform.rotation = targetRotation;
        }
    }
}
