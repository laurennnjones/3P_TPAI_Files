using UnityEngine;

[RequireComponent(typeof(Collider))]
public class GazeProximityActivatorByLayer : MonoBehaviour
{
    public float activationDistance = 3f;

    private Transform playerHead; // Will auto-assign
    public string interactiveLayer = "Interactive";
    public string defaultLayer = "Default";

    private int interactiveLayerIndex;
    private int defaultLayerIndex;

    void Start()
    {
        // 🔍 Auto-assign player head from Main Camera
        Camera cam = Camera.main;
        if (cam != null)
        {
            playerHead = cam.transform;
        }
        else
        {
            Debug.LogWarning("No Main Camera found! Gaze proximity will not function.");
        }

        interactiveLayerIndex = LayerMask.NameToLayer(interactiveLayer);
        defaultLayerIndex = LayerMask.NameToLayer(defaultLayer);

        SetLayer(false); // Start non-interactive
    }

    void Update()
    {
        if (playerHead == null) return;

        float distance = Vector3.Distance(playerHead.position, transform.position);
        SetLayer(distance <= activationDistance);
    }

    void SetLayer(bool makeInteractive)
    {
        int targetLayer = makeInteractive ? interactiveLayerIndex : defaultLayerIndex;

        if (gameObject.layer != targetLayer)
            gameObject.layer = targetLayer;

        // Apply layer to all children
        foreach (Transform child in transform)
            child.gameObject.layer = targetLayer;
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.cyan;
        Gizmos.DrawWireSphere(transform.position, activationDistance);
    }
}
