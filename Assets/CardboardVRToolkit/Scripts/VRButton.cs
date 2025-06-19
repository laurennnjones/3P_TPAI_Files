
using UnityEngine;

public class VRButton : ReticleInteractableBase
{
    public Vector3 hoverScale = new Vector3(1.2f, 1.2f, 1.2f);
    public AudioClip clickSound;
    public AudioSource source;
    public UnityEngine.Events.UnityEvent onClick;

    private Vector3 originalScale;

    private void Start()
    {
        originalScale = transform.localScale;
    }

    public override void OnPointerEnter() => transform.localScale = hoverScale;
    public override void OnPointerExit() => transform.localScale = originalScale;

    public override void OnPointerClick()
    {
        if (clickSound && source) source.PlayOneShot(clickSound);
        onClick?.Invoke();
    }
}
