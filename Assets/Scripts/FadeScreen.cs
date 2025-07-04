using UnityEngine;
using UnityEngine.UI;

public class FadeScreen : MonoBehaviour
{
    public float fadeDuration = 1f;
    private Image fadeImage;

    private void Awake()
    {
        fadeImage = GetComponentInChildren<Image>();
        if (fadeImage != null)
        {
            Color c = fadeImage.color;
            c.a = 0f;
            fadeImage.color = c;
        }
    }

    public void FadeOut()
    {
        if (fadeImage != null)
            StartCoroutine(FadeToBlack());
    }

    private System.Collections.IEnumerator FadeToBlack()
    {
        float elapsed = 0f;
        while (elapsed < fadeDuration)
        {
            elapsed += Time.deltaTime;
            float alpha = Mathf.Clamp01(elapsed / fadeDuration);
            Color c = fadeImage.color;
            c.a = alpha;
            fadeImage.color = c;
            yield return null;
        }
    }
}


// using System.Collections;
// using System.Collections.Generic;
// using UnityEngine;

// public class FadeScreen : MonoBehaviour
// {
//     public bool fadeOnStart = true;
//     public float fadeDuration = 2;
//     public Color fadeColor;
//     public AnimationCurve fadeCurve;
//     public string colorPropertyName = "_Color";
//     private Renderer rend;

//     // Start is called before the first frame update
//     void Start()
//     {
//         rend = GetComponent<Renderer>();
//         rend.enabled = false;

//         if (fadeOnStart)
//             FadeIn();
//     }

//     public void FadeIn()
//     {
//         Fade(1, 0);
//     }

//     public void FadeOut()
//     {
//         Fade(0, 1);
//     }

//     public void Fade(float alphaIn, float alphaOut)
//     {
//         StartCoroutine(FadeRoutine(alphaIn,alphaOut));
//     }

//     public IEnumerator FadeRoutine(float alphaIn,float alphaOut)
//     {
//         rend.enabled = true;

//         float timer = 0;
//         while(timer <= fadeDuration)
//         {
//             Color newColor = fadeColor;
//             newColor.a = Mathf.Lerp(alphaIn, alphaOut, fadeCurve.Evaluate(timer / fadeDuration));

//             rend.material.SetColor(colorPropertyName, newColor);

//             timer += Time.deltaTime;
//             yield return null;
//         }

//         Color newColor2 = fadeColor;
//         newColor2.a = alphaOut;
//         rend.material.SetColor(colorPropertyName, newColor2);

//         if(alphaOut == 0)
//             rend.enabled = false;
//     }
// }
