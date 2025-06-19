using UnityEngine;

public class PlayerHitHandler : MonoBehaviour
{
    public Transform respawnPoint;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Car"))
        {
            Debug.Log("Hit by car! Respawning...");
            transform.position = respawnPoint.position;
        }
    }
}
