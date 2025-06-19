using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class UniversalFadeScreen : MonoBehaviour
{
    public enum FadeType
    {
        Renderer,
        UI,
    }

    public FadeType fadeType = FadeType.Renderer;

    [Header("Common Settings")]
    public bool fadeOnStart = true;
    public float fadeDuration = 2f;
    public AnimationCurve fadeCurve = AnimationCurve.EaseInOut(0, 0, 1, 1);
    public Color fadeColor = Color.black;

    [Header("Renderer Settings")]
    public string colorPropertyName = "_BaseColor";

    private Renderer meshRenderer;

    //[Header("UI Settings")]
    //public Image uiImage;

    private void Awake()
    {
        if (fadeType == FadeType.Renderer)
            meshRenderer = GetComponent<Renderer>();
    }

    private void Start()
    {
        if (fadeOnStart)
            FadeIn();
    }

    public void FadeIn()
    {
        Fade(1, 0);
    }

    public void FadeOut()
    {
        Fade(0, 1);
    }

    public void Fade(float fromAlpha, float toAlpha)
    {
        StartCoroutine(FadeRoutine(fromAlpha, toAlpha));
    }

    private IEnumerator FadeRoutine(float fromAlpha, float toAlpha)
    {
        float timer = 0f;

        if (fadeType == FadeType.Renderer && meshRenderer != null)
        {
            meshRenderer.enabled = true;
        }

        while (timer <= fadeDuration)
        {
            float t = fadeCurve.Evaluate(timer / fadeDuration);
            float alpha = Mathf.Lerp(fromAlpha, toAlpha, t);

            if (fadeType == FadeType.Renderer && meshRenderer != null)
            {
                Color newColor = fadeColor;
                newColor.a = alpha;
                meshRenderer.material.SetColor(colorPropertyName, newColor);
            }
            else if (fadeType == FadeType.UI)
            {
                Color newColor = fadeColor;
                newColor.a = alpha;
                //uiImage.color = newColor;
            }

            timer += Time.deltaTime;
            yield return null;
        }

        if (fadeType == FadeType.Renderer && meshRenderer != null)
        {
            Color finalColor = fadeColor;
            finalColor.a = toAlpha;
            meshRenderer.material.SetColor(colorPropertyName, finalColor);
            if (toAlpha == 0)
                meshRenderer.enabled = false;
        }
        else if (fadeType == FadeType.UI)
        {
            Color finalColor = fadeColor;
            finalColor.a = toAlpha;
            //uiImage.color = finalColor;
        }
    }
}
