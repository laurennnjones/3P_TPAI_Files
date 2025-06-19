using UnityEngine;

public class SpinObject : MonoBehaviour
{
    public float spinSpeed = 90f; // degrees per second

    void Update()
    {
        // Rotate around the Y-axis
        transform.Rotate(Vector3.up, spinSpeed * Time.deltaTime);
    }
}
