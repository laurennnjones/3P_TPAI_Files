
using UnityEngine;
using UnityEngine.Events;

public class VR_UIButton : ReticleInteractableBase
{
    public UnityEvent onClick;
    public Vector3 hoverScale = new Vector3(1.2f, 1.2f, 1.2f);
    private Vector3 originalScale;

    private void Start()
    {
        originalScale = transform.localScale;
    }

    public override void OnPointerEnter()
    {
        transform.localScale = hoverScale;
    }

    public override void OnPointerExit()
    {
        transform.localScale = originalScale;
    }

    public override void OnPointerClick()
    {
        Debug.Log("VR_UIButton clicked!");
        onClick?.Invoke();
    }
}
