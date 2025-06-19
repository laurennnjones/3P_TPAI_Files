using UnityEngine;
using UnityEngine.Rendering;

public class PostProcessingUnderwaterToggle : MonoBehaviour
{
    public float oceanSurfaceY = 0f;
    public Volume underwaterVolume;

    private bool isUnderwater = false;

    void Start()
    {
        if (underwaterVolume != null)
            underwaterVolume.weight = 0f; // Start disabled
    }

    void Update()
    {
        float currentY = transform.position.y;

        if (currentY < oceanSurfaceY && !isUnderwater)
        {
            isUnderwater = true;
            underwaterVolume.weight = Mathf.Lerp(underwaterVolume.weight, 1f, Time.deltaTime * 2f);

        }
        else if (currentY >= oceanSurfaceY && isUnderwater)
        {
            isUnderwater = false;
            underwaterVolume.weight = 0f;
        }
    }
}
