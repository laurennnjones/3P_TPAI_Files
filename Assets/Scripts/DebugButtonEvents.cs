using UnityEngine;
using UnityEngine.EventSystems;

public class DebugButtonEvents : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler
{
    public void OnPointerClick(PointerEventData eventData)
    {
        Debug.Log("Button CLICKED!");
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("Pointer entered button!");
    }
}
