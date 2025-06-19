using UnityEngine;
using UnityEngine.UI;

public class UIButtonStyler : MonoBehaviour
{
    [System.Serializable]
    public struct ButtonStyle
    {
        public Button button;
        public Color baseColor;
    }

    public ButtonStyle[] buttonsToStyle;

    private void Start()
    {
        foreach (var style in buttonsToStyle)
        {
            ApplyStyle(style.button, style.baseColor);
        }
    }

    private void ApplyStyle(Button button, Color baseColor)
    {
        ColorBlock colors = button.colors;

        colors.normalColor = baseColor;
        colors.highlightedColor = LightenColor(baseColor, 0.15f);
        colors.pressedColor = DarkenColor(baseColor, 0.15f);
        colors.selectedColor = colors.normalColor;
        colors.disabledColor = new Color(baseColor.r, baseColor.g, baseColor.b, 0.5f); // faded

        button.colors = colors;
    }

    private Color LightenColor(Color color, float amount)
    {
        return new Color(
            Mathf.Clamp01(color.r + amount),
            Mathf.Clamp01(color.g + amount),
            Mathf.Clamp01(color.b + amount),
            color.a);
    }

    private Color DarkenColor(Color color, float amount)
    {
        return new Color(
            Mathf.Clamp01(color.r - amount),
            Mathf.Clamp01(color.g - amount),
            Mathf.Clamp01(color.b - amount),
            color.a);
    }
}
