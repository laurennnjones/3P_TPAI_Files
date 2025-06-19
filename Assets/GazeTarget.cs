using UnityEngine;

public class JumpTarget : MonoBehaviour
{
    public Material normalMaterial;
    public Material highlightMaterial;

    private Renderer rend;

    protected virtual void Start()
    {
        rend = GetComponent<Renderer>();
        SetGazeState(false);
    }

    public void OnPointerEnter()
    {
        SetGazeState(true);
    }

    public void OnPointerExit()
    {
        SetGazeState(false);
    }

    public virtual void OnPointerClick()
    {
        GameObject player = GameObject.FindWithTag("Player");
        if (player != null)
        {
            var jump = player.GetComponent<PlayerJumpController>();
            if (jump != null)
            {
                jump.JumpTo(transform.position, transform); // Parent to this
            }
        }
    }

    private void SetGazeState(bool gazed)
    {
        if (rend != null && normalMaterial != null && highlightMaterial != null)
            rend.material = gazed ? highlightMaterial : normalMaterial;
    }
}
