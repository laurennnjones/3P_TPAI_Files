using UnityEngine;

public class BananaCollision : MonoBehaviour
{
    public GameObject bandanaPrefab;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("MonkeyHead"))
        {
            Transform monkey = other.transform.root;

            BandanaHandler handler = monkey.GetComponent<BandanaHandler>();
            if (handler != null && !handler.HasBandana)
            {
                handler.AttachBandana();
                ScoreManager.Instance.AddPoint();
                Destroy(gameObject); // Destroy banana
            }
        }
    }
}
