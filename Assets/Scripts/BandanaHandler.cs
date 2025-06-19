using UnityEngine;

public class BandanaHandler : MonoBehaviour
{
    public GameObject bandanaPrefab;
    public Transform bandanaAnchor;
    public bool HasBandana { get; private set; } = false;

    public void AttachBandana()
    {
        if (HasBandana)
            return;

        Instantiate(bandanaPrefab, bandanaAnchor.position, bandanaAnchor.rotation, bandanaAnchor);
        HasBandana = true;
    }
}
