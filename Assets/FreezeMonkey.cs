using System.Collections;
using UnityEngine;

public class MonkeyFreeze : MonoBehaviour
{
    private Animator animator;
    private bool isFrozen = false;

    void Awake()
    {
        animator = GetComponentInChildren<Animator>();
    }

    public void FreezeForSeconds(float seconds)
    {
        if (isFrozen) return;
        isFrozen = true;

        if (animator != null)
            animator.enabled = false;

        StartCoroutine(UnfreezeAfterDelay(seconds));
    }

    private IEnumerator UnfreezeAfterDelay(float seconds)
    {
        yield return new WaitForSeconds(seconds);
        if (animator != null)
            animator.enabled = true;
        isFrozen = false;
    }
}
