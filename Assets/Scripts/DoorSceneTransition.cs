using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class DoorSceneChanger
    : MonoBehaviour,
        IPointerEnterHandler,
        IPointerExitHandler,
        IPointerClickHandler
{
    [Tooltip("Name of the scene to load when this door is clicked.")]
    public string targetSceneName;

    [Tooltip("Material to show when the door is not being gazed at.")]
    public Material inactiveMaterial;

    [Tooltip("Material to show when the door is being gazed at.")]
    public Material gazedAtMaterial;

    private Renderer doorRenderer;

    void Start()
    {
        doorRenderer = GetComponent<Renderer>();
        if (doorRenderer != null && inactiveMaterial != null)
        {
            doorRenderer.material = inactiveMaterial;
        }
    }

    // Called when the reticle pointer starts hovering over the door.
    public void OnPointerEnter(PointerEventData eventData)
    {
        if (doorRenderer != null && gazedAtMaterial != null)
        {
            doorRenderer.material = gazedAtMaterial;
        }
    }

    // Called when the reticle pointer stops hovering over the door.
    public void OnPointerExit(PointerEventData eventData)
    {
        if (doorRenderer != null && inactiveMaterial != null)
        {
            doorRenderer.material = inactiveMaterial;
        }
    }

    // Called when the door is clicked (e.g., user triggers the Cardboard action).
    public void OnPointerClick(PointerEventData eventData)
    {
        if (!string.IsNullOrEmpty(targetSceneName))
        {
            // Optionally, you can add a fade-out effect or a short delay here.
            SceneManager.LoadScene(targetSceneName);
        }
        else
        {
            Debug.LogWarning("Target scene name is not set on the DoorSceneChanger.");
        }
    }
}
