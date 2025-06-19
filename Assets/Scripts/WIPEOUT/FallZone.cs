using UnityEngine;

public class FallZone : MonoBehaviour
{
    public Transform respawnPoint;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Player fell — respawning.");
            other.transform.position = respawnPoint.position;
        }
    }

}


