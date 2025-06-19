using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class ChapterManager : MonoBehaviour
{
    [Header("Intro UI")]
    public GameObject chapterTitleCanvas;

    [Header("Dialogue Canvases")]
    public List<GameObject> dialogueCanvases;

    private bool hasStartedDialogue = false;

    private bool isDialogueActive = false;

    public bool usePiranha,
        useIguana,
        useDragon,
        useGorilla,
        useMonkey,
        usePanther;

    [Header("Piranha")]
    public GameObject piranha;
    public GameObject piranhaBubble;
    public TextMeshProUGUI piranhaText;
    public SkinnedMeshRenderer piranhaSMR;

    [Header("Iguana")]
    public GameObject iguana;
    public GameObject iguanaBubble;
    public TextMeshProUGUI iguanaText;
    public SkinnedMeshRenderer iguanaSMR;

    [Header("Dragon")]
    public GameObject dragon;
    public GameObject dragonBubble;
    public TextMeshProUGUI dragonText;
    public SkinnedMeshRenderer dragonSMR;

    [Header("Gorilla")]
    public GameObject gorilla;
    public GameObject gorillaBubble;
    public TextMeshProUGUI gorillaText;
    public SkinnedMeshRenderer gorillaSMR;

    [Header("Monkey")]
    public GameObject monkey;
    public GameObject monkeyBubble;
    public TextMeshProUGUI monkeyText;
    public SkinnedMeshRenderer monkeySMR;

    [Header("Panther")]
    public GameObject panther;
    public GameObject pantherBubble;
    public TextMeshProUGUI pantherText;
    public SkinnedMeshRenderer pantherSMR;

    public AudioSource audioSource;
    public DialogueData dialogueData;
    public AudioClip[] dialogueAudioClips;
    public PrefabWithPosition[] globalPrefabEntries;

    private Dictionary<DialogueLine.Speaker, GameObject> characterObjects = new();
    private Dictionary<DialogueLine.Speaker, GameObject> dialogueBubbles = new();
    private Dictionary<DialogueLine.Speaker, TextMeshProUGUI> dialogueTexts = new();
    private Dictionary<DialogueLine.Speaker, SkinnedMeshRenderer[]> meshRenderers = new();

    private Dictionary<DialogueLine.Speaker, Animator> animators = new();

    private Dictionary<DialogueLine.Speaker, Coroutine> returnStateCoroutines = new();

    private Queue<DialogueLine> dialogueQueue = new();
    private Stack<DialogueLine> dialogueHistory = new();
    private List<GameObject> currentModelInstances = new();
    private Dictionary<DialogueLine.Speaker, Coroutine> blinkCoroutines = new();

    private void Awake()
    {
        void TryAdd<T>(Dictionary<DialogueLine.Speaker, T> dict, DialogueLine.Speaker key, T value)
        {
            if (value != null)
                dict[key] = value;
        }

        SkinnedMeshRenderer[] GetAllLODs(GameObject character)
        {
            return character != null
                ? character.GetComponentsInChildren<SkinnedMeshRenderer>()
                : null;
        }

        if (usePiranha)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.PIRANHA, piranha);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.PIRANHA, piranhaBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.PIRANHA, piranhaText);
            meshRenderers[DialogueLine.Speaker.PIRANHA] = GetAllLODs(piranha);
            if (piranha != null)
                animators[DialogueLine.Speaker.PIRANHA] = piranha.GetComponent<Animator>();
        }

        if (useIguana)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.IGUANA, iguana);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.IGUANA, iguanaBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.IGUANA, iguanaText);
            meshRenderers[DialogueLine.Speaker.IGUANA] = GetAllLODs(iguana);
            if (iguana != null)
                animators[DialogueLine.Speaker.IGUANA] = iguana.GetComponent<Animator>();
        }

        if (useDragon)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.DRAGON, dragon);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.DRAGON, dragonBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.DRAGON, dragonText);
            meshRenderers[DialogueLine.Speaker.DRAGON] = GetAllLODs(dragon);
            if (dragon != null)
                animators[DialogueLine.Speaker.DRAGON] = dragon.GetComponent<Animator>();
        }

        if (useGorilla)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.GORILLA, gorilla);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.GORILLA, gorillaBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.GORILLA, gorillaText);
            meshRenderers[DialogueLine.Speaker.GORILLA] = GetAllLODs(gorilla);
            if (gorilla != null)
                animators[DialogueLine.Speaker.GORILLA] = gorilla.GetComponent<Animator>();
        }

        if (useMonkey)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.MONKEY, monkey);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.MONKEY, monkeyBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.MONKEY, monkeyText);
            meshRenderers[DialogueLine.Speaker.MONKEY] = GetAllLODs(monkey);
            if (monkey != null)
                animators[DialogueLine.Speaker.MONKEY] = monkey.GetComponent<Animator>();
        }

        if (usePanther)
        {
            TryAdd(characterObjects, DialogueLine.Speaker.PANTHER, panther);
            TryAdd(dialogueBubbles, DialogueLine.Speaker.PANTHER, pantherBubble);
            TryAdd(dialogueTexts, DialogueLine.Speaker.PANTHER, pantherText);
            meshRenderers[DialogueLine.Speaker.PANTHER] = GetAllLODs(panther);
            if (panther != null)
                animators[DialogueLine.Speaker.PANTHER] = panther.GetComponent<Animator>();
        }
    }

    private void Start()
    {
        // Hide chapter title on first click
        if (chapterTitleCanvas != null)
            chapterTitleCanvas.SetActive(true);

        // ✅ Hide all dialogue canvases until first click
        foreach (var canvas in dialogueCanvases)
            if (canvas != null)
                canvas.SetActive(false);
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            // FIRST CLICK → Begin dialogue and hide chapter title
            if (!hasStartedDialogue)
            {
                hasStartedDialogue = true;

                if (chapterTitleCanvas != null)
                    chapterTitleCanvas.SetActive(false);

                // ✅ Show all dialogue canvases now
                foreach (var canvas in dialogueCanvases)
                    if (canvas != null)
                        canvas.SetActive(true);

                ActivateCharacters();
                InitializeDialogue();
                DisplayNextLine();
                return;
            }

            // SUBSEQUENT CLICKS → Navigate dialogue
            if (isDialogueActive)
            {
                DisplayNextLine();
            }
        }
    }

    private void InitializeDialogue()
    {
        foreach (DialogueLine line in dialogueData.dialogueLines)
        {
            dialogueQueue.Enqueue(line);
        }
    }

    public void DisplayNextLine()
    {
        if (dialogueQueue.Count == 0)
        {
            EndStory();
            return;
        }

        DialogueLine line = dialogueQueue.Dequeue();
        dialogueHistory.Push(line); // ✅ This is the correct line to store
        DisplayLine(line);
    }

    private void DisplayLine(DialogueLine line)
    {
        // Destroy any previously spawned prefabs
        foreach (var obj in currentModelInstances)
            Destroy(obj);
        currentModelInstances.Clear();

        // Spawn any prefabs this line needs
        foreach (int i in line.prefabIndices)
        {
            if (i >= 0 && i < globalPrefabEntries.Length)
            {
                var entry = globalPrefabEntries[i];
                if (entry.prefab != null)
                {
                    GameObject spawned = Instantiate(
                        entry.prefab,
                        entry.position,
                        Quaternion.identity
                    );
                    spawned.transform.localScale = entry.scale;
                    currentModelInstances.Add(spawned);
                    StartCoroutine(SpinPrefab(spawned, 30f));
                }
            }
        }

        // Deactivate all dialogue bubbles and text objects
        foreach (var kvp in dialogueBubbles)
            kvp.Value.SetActive(false);

        foreach (var kvp in dialogueTexts)
            kvp.Value.gameObject.SetActive(false);

        // Activate correct bubble
        if (
            !dialogueBubbles.TryGetValue(line.speaker, out var bubbleToShow)
            || bubbleToShow == null
        )
        {
            Debug.LogError($"[DisplayLine] No bubble for speaker: {line.speaker}");
        }
        else
        {
            bubbleToShow.SetActive(true);
        }

        // Activate correct text
        if (!dialogueTexts.TryGetValue(line.speaker, out var textBox) || textBox == null)
        {
            Debug.LogError($"[DisplayLine] No text box for speaker: {line.speaker}");
        }
        else
        {
            if (string.IsNullOrWhiteSpace(line.text))
                Debug.LogWarning($"[DisplayLine] Line text is empty for: {line.speaker}");

            textBox.gameObject.SetActive(false); // 🧼 Force clean slate
            StartCoroutine(ResetAndShowWorldSpaceText(textBox, line.text));
        }

        // Play character animation
        animators.TryGetValue(line.speaker, out var animator);
        meshRenderers.TryGetValue(line.speaker, out var smr);

        // Stop blinking for the speaker so it doesn’t override their shapekey expression
        StopBlinking(line.speaker);

        if (animator != null)
        {
            ChangeAnimation(animator, line.animationName);

            if (
                returnStateCoroutines.TryGetValue(line.speaker, out var existingCo)
                && existingCo != null
            )
                StopCoroutine(existingCo);

            Coroutine newCo = StartCoroutine(
                ReturnToDefaultStateAfterSpeaking(animator, GetDefaultState(line.speaker))
            );
            returnStateCoroutines[line.speaker] = newCo;
        }

        // Apply speaker shapekey
        if (smr != null)
            ChangeShapekey(line.speaker, line.shapekeyName);
        Debug.Log($"Applying shapekey '{line.shapekeyName}' to {line.speaker}");

        // Play line audio
        PlayDialogueAudio(line.audioClip);

        // Mark dialogue as active
        isDialogueActive = true;

        // Apply animations/shapekeys to non-speaking characters
        ApplyNonSpeakingCharacterActions(line);
    }

    private IEnumerator SpinPrefab(GameObject obj, float speed)
    {
        while (obj != null)
        {
            obj.transform.Rotate(Vector3.up, speed * Time.deltaTime);
            yield return null;
        }
    }

    private IEnumerator ReturnToDefaultStateAfterSpeaking(
        Animator animator,
        DialogueLine.AnimationName state
    )
    {
        float waitTime = (audioSource.clip != null) ? audioSource.clip.length : 1f;
        yield return new WaitForSeconds(waitTime);
        ChangeAnimation(animator, state);
    }

    private SkinnedMeshRenderer[] GetMeshRenderersForCharacter(DialogueLine.Speaker speaker)
    {
        meshRenderers.TryGetValue(speaker, out var smrArray);
        return smrArray;
    }

    private DialogueLine.Speaker GetCurrentSpeaker()
    {
        foreach (var kvp in dialogueTexts)
        {
            if (kvp.Value.gameObject.activeSelf)
                return kvp.Key;
        }
        return DialogueLine.Speaker.PIRANHA;
    }

    private string GetCurrentText()
    {
        foreach (var kvp in dialogueTexts)
        {
            if (kvp.Value.gameObject.activeSelf)
                return kvp.Value.text;
        }
        return "";
    }

    private DialogueLine.AnimationName GetDefaultState(DialogueLine.Speaker speaker)
    {
        return speaker switch
        {
            DialogueLine.Speaker.PIRANHA => DialogueLine.AnimationName.Swim,
            DialogueLine.Speaker.DRAGON => DialogueLine.AnimationName.Fly,
            DialogueLine.Speaker.IGUANA => DialogueLine.AnimationName.Sit,
            _ => DialogueLine.AnimationName.Sit,
        };
    }

    private void ApplyNonSpeakingCharacterActions(DialogueLine line)
    {
        foreach (var speaker in dialogueData.sceneCharacters)
        {
            if (speaker == line.speaker)
                continue;

            DialogueLine.CharacterAction action = line.nonSpeakingCharacterActions.Find(a =>
                a.character == speaker
            );
            animators.TryGetValue(speaker, out var animator);
            meshRenderers.TryGetValue(speaker, out var smr);

            if (action != null)
            {
                if (action.animation != DialogueLine.AnimationName.None && animator != null)
                    ChangeAnimation(animator, action.animation);
                else if (animator != null)
                    ChangeAnimation(animator, line.GetDefaultIdleAnimation(speaker));

                if (action.shapekey != DialogueLine.ShapekeyName.None && smr != null)
                {
                    StopBlinking(speaker);
                    if (action.shapekey != DialogueLine.ShapekeyName.None && smr != null)
                    {
                        StopBlinking(speaker);
                        ChangeShapekey(speaker, action.shapekey); // ✅ fix
                    }
                }
                else if (smr != null)
                {
                    StartBlinking(speaker, smr[0]);
                }
            }
        }
    }

    private void StartBlinking(DialogueLine.Speaker speaker, SkinnedMeshRenderer meshRenderer)
    {
        if (blinkCoroutines.ContainsKey(speaker) && blinkCoroutines[speaker] != null)
        {
            StopCoroutine(blinkCoroutines[speaker]);
        }

        blinkCoroutines[speaker] = StartCoroutine(BlinkCoroutine(meshRenderer, speaker));
    }

    private void StopBlinking(DialogueLine.Speaker speaker)
    {
        if (blinkCoroutines.ContainsKey(speaker) && blinkCoroutines[speaker] != null)
        {
            StopCoroutine(blinkCoroutines[speaker]);
            blinkCoroutines[speaker] = null;
        }
    }

    private IEnumerator BlinkCoroutine(
        SkinnedMeshRenderer meshRenderer,
        DialogueLine.Speaker speaker
    )
    {
        if (meshRenderer == null || meshRenderer.sharedMesh == null)
        {
            Debug.LogWarning(
                "BlinkCoroutine: SkinnedMeshRenderer or its sharedMesh is null for " + speaker
            );
            yield break;
        }

        int blinkIndex = meshRenderer.sharedMesh.GetBlendShapeIndex("eyes.blink");
        while (true)
        {
            if (blinkIndex >= 0 && blinkIndex < meshRenderer.sharedMesh.blendShapeCount)
            {
                meshRenderer.SetBlendShapeWeight(blinkIndex, 100f);
                yield return new WaitForSeconds(0.1f);
                meshRenderer.SetBlendShapeWeight(blinkIndex, 0f);
            }

            float blinkInterval = Random.Range(5f, 10f);
            yield return new WaitForSeconds(blinkInterval);
        }
    }

    public static string GetShapekeyBlendshapeName(DialogueLine.ShapekeyName shapekey)
    {
        return shapekey.ToString().Replace("_", ".").ToLower(); // Eyes_Blink → eyes.blink
    }

    public void ChangeAnimation(Animator animator, DialogueLine.AnimationName state)
    {
        if (animator == null || state == DialogueLine.AnimationName.None)
            return;

        string name = state.ToString();
        if (animator.HasState(0, Animator.StringToHash(name)))
            animator.Play(name);
        else
            Debug.LogWarning($"Animation '{name}' not found on animator.");
    }

    public void ChangeShapekey(DialogueLine.Speaker speaker, DialogueLine.ShapekeyName shapekey)
    {
        if (
            !meshRenderers.TryGetValue(speaker, out SkinnedMeshRenderer[] smrArray)
            || shapekey == DialogueLine.ShapekeyName.None
        )
            return;

        int index = (int)shapekey;

        foreach (var smr in smrArray)
        {
            if (smr == null || smr.sharedMesh == null)
                continue;

            for (int i = 0; i < smr.sharedMesh.blendShapeCount; i++)
                smr.SetBlendShapeWeight(i, 0f);

            if (index >= 0 && index < smr.sharedMesh.blendShapeCount)
                smr.SetBlendShapeWeight(index, 100f);
        }
    }

    private void PlayDialogueAudio(AudioClip clip)
    {
        if (clip != null)
        {
            audioSource.clip = clip;
            audioSource.Play();
        }
    }

    private void EndStory()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }

    public void ActivateCharacters()
    {
        foreach (var speaker in dialogueData.sceneCharacters)
        {
            if (characterObjects.TryGetValue(speaker, out var obj))
                obj.SetActive(true);

            if (dialogueBubbles.TryGetValue(speaker, out var bubble))
                bubble.SetActive(false);

            if (meshRenderers.TryGetValue(speaker, out var smrArray) && smrArray.Length > 0)
                StartBlinking(speaker, smrArray[0]); // pick the main LOD to blink
        }
    }

    private IEnumerator ResetAndShowWorldSpaceText(TextMeshProUGUI textBox, string text)
    {
        yield return null; // Allow deactivate to register

        textBox.gameObject.SetActive(true); // Now activate again
        textBox.text = text;
        textBox.ForceMeshUpdate();

        var canvas = textBox.GetComponentInParent<Canvas>();
        if (canvas != null)
            Canvas.ForceUpdateCanvases();

        LayoutRebuilder.ForceRebuildLayoutImmediate((RectTransform)textBox.transform);
    }
}


// using System.Collections;
// using System.Collections.Generic;
// using TMPro;
// using UnityEngine;
// using UnityEngine.InputSystem;
// using UnityEngine.SceneManagement;
// using UnityEngine.UI;

// public class DragonPepeLanaManager : MonoBehaviour
// {
//     [Header("Intro UI")]
//     public GameObject chapterTitleCanvas;

//     [Header("Dialogue Canvases")]
//     public List<GameObject> dialogueCanvases;

//     private bool hasStartedDialogue = false;

//     private bool isDialogueActive = false;

//     public bool usePiranha,
//         useIguana,
//         useDragon,
//         useGorilla,
//         useMonkey,
//         usePanther;

//     [Header("Piranha")]
//     public GameObject piranha;
//     public GameObject piranhaBubble;
//     public TextMeshProUGUI piranhaText;
//     public SkinnedMeshRenderer piranhaSMR;

//     [Header("Iguana")]
//     public GameObject iguana;
//     public GameObject iguanaBubble;
//     public TextMeshProUGUI iguanaText;
//     public SkinnedMeshRenderer iguanaSMR;

//     [Header("Dragon")]
//     public GameObject dragon;
//     public GameObject dragonBubble;
//     public TextMeshProUGUI dragonText;
//     public SkinnedMeshRenderer dragonSMR;

//     [Header("Gorilla")]
//     public GameObject gorilla;
//     public GameObject gorillaBubble;
//     public TextMeshProUGUI gorillaText;
//     public SkinnedMeshRenderer gorillaSMR;

//     [Header("Monkey")]
//     public GameObject monkey;
//     public GameObject monkeyBubble;
//     public TextMeshProUGUI monkeyText;
//     public SkinnedMeshRenderer monkeySMR;

//     [Header("Panther")]
//     public GameObject panther;
//     public GameObject pantherBubble;
//     public TextMeshProUGUI pantherText;
//     public SkinnedMeshRenderer pantherSMR;

//     public AudioSource audioSource;
//     public DialogueData dialogueData;
//     public AudioClip[] dialogueAudioClips;
//     public PrefabWithPosition[] globalPrefabEntries;

//     private Dictionary<DialogueLine.Speaker, GameObject> characterObjects = new();
//     private Dictionary<DialogueLine.Speaker, GameObject> dialogueBubbles = new();
//     private Dictionary<DialogueLine.Speaker, TextMeshProUGUI> dialogueTexts = new();
//     private Dictionary<DialogueLine.Speaker, SkinnedMeshRenderer> meshRenderers = new();
//     private Dictionary<DialogueLine.Speaker, Animator> animators = new();

//     private Dictionary<DialogueLine.Speaker, Coroutine> returnStateCoroutines = new();

//     private Queue<DialogueLine> dialogueQueue = new();
//     private Stack<DialogueLine> dialogueHistory = new();
//     private List<GameObject> currentModelInstances = new();
//     private Dictionary<DialogueLine.Speaker, Coroutine> blinkCoroutines = new();

//     private void Awake()
//     {
//         void TryAdd<T>(Dictionary<DialogueLine.Speaker, T> dict, DialogueLine.Speaker key, T value)
//         {
//             if (value != null)
//                 dict[key] = value;
//         }

//         if (usePiranha)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.PIRANHA, piranha);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.PIRANHA, piranhaBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.PIRANHA, piranhaText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.PIRANHA, piranhaSMR);
//             if (piranha != null)
//                 animators[DialogueLine.Speaker.PIRANHA] = piranha.GetComponent<Animator>();
//         }

//         if (useIguana)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.IGUANA, iguana);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.IGUANA, iguanaBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.IGUANA, iguanaText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.IGUANA, iguanaSMR);
//             if (iguana != null)
//                 animators[DialogueLine.Speaker.IGUANA] = iguana.GetComponent<Animator>();
//         }

//         if (useDragon)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.DRAGON, dragon);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.DRAGON, dragonBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.DRAGON, dragonText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.DRAGON, dragonSMR);
//             if (dragon != null)
//                 animators[DialogueLine.Speaker.DRAGON] = dragon.GetComponent<Animator>();
//         }

//         if (useGorilla)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.GORILLA, gorilla);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.GORILLA, gorillaBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.GORILLA, gorillaText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.GORILLA, gorillaSMR);
//             if (gorilla != null)
//                 animators[DialogueLine.Speaker.GORILLA] = gorilla.GetComponent<Animator>();
//         }

//         if (useMonkey)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.MONKEY, monkey);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.MONKEY, monkeyBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.MONKEY, monkeyText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.MONKEY, monkeySMR);
//             if (monkey != null)
//                 animators[DialogueLine.Speaker.MONKEY] = monkey.GetComponent<Animator>();
//         }

//         if (usePanther)
//         {
//             TryAdd(characterObjects, DialogueLine.Speaker.PANTHER, panther);
//             TryAdd(dialogueBubbles, DialogueLine.Speaker.PANTHER, pantherBubble);
//             TryAdd(dialogueTexts, DialogueLine.Speaker.PANTHER, pantherText);
//             TryAdd(meshRenderers, DialogueLine.Speaker.PANTHER, pantherSMR);
//             if (panther != null)
//                 animators[DialogueLine.Speaker.PANTHER] = panther.GetComponent<Animator>();
//         }
//     }

//     private void Start()
//     {
//         // Hide chapter title on first click
//         if (chapterTitleCanvas != null)
//             chapterTitleCanvas.SetActive(true);

//         // ✅ Hide all dialogue canvases until first click
//         foreach (var canvas in dialogueCanvases)
//             if (canvas != null)
//                 canvas.SetActive(false);
//     }

//     private void Update()
//     {
//         if (Input.GetMouseButtonDown(0))
//         {
//             // FIRST CLICK → Begin dialogue and hide chapter title
//             if (!hasStartedDialogue)
//             {
//                 hasStartedDialogue = true;

//                 if (chapterTitleCanvas != null)
//                     chapterTitleCanvas.SetActive(false);

//                 // ✅ Show all dialogue canvases now
//                 foreach (var canvas in dialogueCanvases)
//                     if (canvas != null)
//                         canvas.SetActive(true);

//                 ActivateCharacters();
//                 InitializeDialogue();
//                 DisplayNextLine();
//                 return;
//             }

//             // SUBSEQUENT CLICKS → Navigate dialogue
//             if (isDialogueActive)
//             {
//                 DisplayNextLine();
//             }
//         }
//     }

//     private void InitializeDialogue()
//     {
//         foreach (DialogueLine line in dialogueData.dialogueLines)
//         {
//             dialogueQueue.Enqueue(line);
//         }
//     }

//     public void DisplayNextLine()
//     {
//         if (dialogueQueue.Count == 0)
//         {
//             EndStory();
//             return;
//         }

//         DialogueLine line = dialogueQueue.Dequeue();
//         dialogueHistory.Push(line); // ✅ This is the correct line to store
//         DisplayLine(line);
//     }

//     private void DisplayLine(DialogueLine line)
//     {
//         // Destroy any previously spawned prefabs
//         foreach (var obj in currentModelInstances)
//             Destroy(obj);
//         currentModelInstances.Clear();

//         // Spawn any prefabs this line needs
//         foreach (int i in line.prefabIndices)
//         {
//             if (i >= 0 && i < globalPrefabEntries.Length)
//             {
//                 var entry = globalPrefabEntries[i];
//                 if (entry.prefab != null)
//                 {
//                     GameObject spawned = Instantiate(
//                         entry.prefab,
//                         entry.position,
//                         Quaternion.identity
//                     );
//                     spawned.transform.localScale = entry.scale;
//                     currentModelInstances.Add(spawned);
//                     StartCoroutine(SpinPrefab(spawned, 30f));
//                 }
//             }
//         }

//         // Deactivate all dialogue bubbles and text objects
//         foreach (var kvp in dialogueBubbles)
//             kvp.Value.SetActive(false);

//         foreach (var kvp in dialogueTexts)
//             kvp.Value.gameObject.SetActive(false);

//         // Activate correct bubble
//         if (
//             !dialogueBubbles.TryGetValue(line.speaker, out var bubbleToShow)
//             || bubbleToShow == null
//         )
//         {
//             Debug.LogError($"[DisplayLine] No bubble for speaker: {line.speaker}");
//         }
//         else
//         {
//             bubbleToShow.SetActive(true);
//         }

//         // Activate correct text
//         if (!dialogueTexts.TryGetValue(line.speaker, out var textBox) || textBox == null)
//         {
//             Debug.LogError($"[DisplayLine] No text box for speaker: {line.speaker}");
//         }
//         else
//         {
//             if (string.IsNullOrWhiteSpace(line.text))
//                 Debug.LogWarning($"[DisplayLine] Line text is empty for: {line.speaker}");

//             textBox.gameObject.SetActive(false); // 🧼 Force clean slate
//             StartCoroutine(ResetAndShowWorldSpaceText(textBox, line.text));
//         }

//         // Play character animation
//         animators.TryGetValue(line.speaker, out var animator);
//         meshRenderers.TryGetValue(line.speaker, out var smr);

//         // Stop blinking for the speaker so it doesn’t override their shapekey expression
//         StopBlinking(line.speaker);

//         if (animator != null)
//         {
//             ChangeAnimation(animator, line.animationName);

//             if (
//                 returnStateCoroutines.TryGetValue(line.speaker, out var existingCo)
//                 && existingCo != null
//             )
//                 StopCoroutine(existingCo);

//             Coroutine newCo = StartCoroutine(
//                 ReturnToDefaultStateAfterSpeaking(animator, GetDefaultState(line.speaker))
//             );
//             returnStateCoroutines[line.speaker] = newCo;
//         }

//         // Apply speaker shapekey
//         if (smr != null)
//             ChangeShapekey(line.speaker, line.shapekeyName);

//         // Play line audio
//         PlayDialogueAudio(line.audioClip);

//         // Mark dialogue as active
//         isDialogueActive = true;

//         // Apply animations/shapekeys to non-speaking characters
//         ApplyNonSpeakingCharacterActions(line);
//     }

//     private IEnumerator SpinPrefab(GameObject obj, float speed)
//     {
//         while (obj != null)
//         {
//             obj.transform.Rotate(Vector3.up, speed * Time.deltaTime);
//             yield return null;
//         }
//     }

//     private IEnumerator ReturnToDefaultStateAfterSpeaking(
//         Animator animator,
//         DialogueLine.AnimationName state
//     )
//     {
//         float waitTime = (audioSource.clip != null) ? audioSource.clip.length : 1f;
//         yield return new WaitForSeconds(waitTime);
//         ChangeAnimation(animator, state);
//     }

//     private DialogueLine.Speaker GetCurrentSpeaker()
//     {
//         foreach (var kvp in dialogueTexts)
//         {
//             if (kvp.Value.gameObject.activeSelf)
//                 return kvp.Key;
//         }
//         return DialogueLine.Speaker.PIRANHA;
//     }

//     private string GetCurrentText()
//     {
//         foreach (var kvp in dialogueTexts)
//         {
//             if (kvp.Value.gameObject.activeSelf)
//                 return kvp.Value.text;
//         }
//         return "";
//     }

//     private DialogueLine.AnimationName GetDefaultState(DialogueLine.Speaker speaker)
//     {
//         return speaker switch
//         {
//             DialogueLine.Speaker.PIRANHA => DialogueLine.AnimationName.Swim,
//             DialogueLine.Speaker.DRAGON => DialogueLine.AnimationName.Fly,
//             DialogueLine.Speaker.IGUANA => DialogueLine.AnimationName.Sit,
//             _ => DialogueLine.AnimationName.Sit,
//         };
//     }

//     private void ApplyNonSpeakingCharacterActions(DialogueLine line)
//     {
//         foreach (var speaker in dialogueData.sceneCharacters)
//         {
//             if (speaker == line.speaker)
//                 continue;

//             DialogueLine.CharacterAction action = line.nonSpeakingCharacterActions.Find(a =>
//                 a.character == speaker
//             );
//             animators.TryGetValue(speaker, out var animator);
//             meshRenderers.TryGetValue(speaker, out var smr);

//             if (action != null)
//             {
//                 if (action.animation != DialogueLine.AnimationName.None && animator != null)
//                     ChangeAnimation(animator, action.animation);
//                 else if (animator != null)
//                     ChangeAnimation(animator, line.GetDefaultIdleAnimation(speaker));

//                 if (action.shapekey != DialogueLine.ShapekeyName.None && smr != null)
//                 {
//                     StopBlinking(speaker);
//                     ChangeShapekey(smr, action.shapekey);
//                 }
//                 else if (smr != null)
//                 {
//                     StartBlinking(speaker, smr);
//                 }
//             }
//         }
//     }

//     private void StartBlinking(DialogueLine.Speaker speaker, SkinnedMeshRenderer smr)
//     {
//         if (blinkCoroutines.TryGetValue(speaker, out var co) && co != null)
//             StopCoroutine(co);

//         blinkCoroutines[speaker] = StartCoroutine(BlinkCoroutine(smr, speaker));
//     }

//     private void StopBlinking(DialogueLine.Speaker speaker)
//     {
//         if (blinkCoroutines.TryGetValue(speaker, out var co) && co != null)
//             StopCoroutine(co);

//         blinkCoroutines[speaker] = null;
//     }

//     private IEnumerator BlinkCoroutine(SkinnedMeshRenderer smr, DialogueLine.Speaker speaker)
//     {
//         if (smr == null || smr.sharedMesh == null)
//             yield break;

//         int index = smr.sharedMesh.GetBlendShapeIndex("eyes.blink");

//         while (true)
//         {
//             if (index >= 0 && index < smr.sharedMesh.blendShapeCount)
//             {
//                 smr.SetBlendShapeWeight(index, 100f);
//                 yield return new WaitForSeconds(0.1f);
//                 smr.SetBlendShapeWeight(index, 0f);
//             }

//             yield return new WaitForSeconds(Random.Range(4f, 8f));
//         }
//     }

//     public void ChangeAnimation(Animator animator, DialogueLine.AnimationName state)
//     {
//         if (animator == null || state == DialogueLine.AnimationName.None)
//             return;

//         string name = state.ToString();
//         if (animator.HasState(0, Animator.StringToHash(name)))
//             animator.Play(name);
//         else
//             Debug.LogWarning($"Animation '{name}' not found on animator.");
//     }

//     public void ChangeShapekey(SkinnedMeshRenderer smr, DialogueLine.ShapekeyName shapekey)
//     {
//         if (smr == null || shapekey == DialogueLine.ShapekeyName.None)
//             return;

//         for (int i = 0; i < smr.sharedMesh.blendShapeCount; i++)
//             smr.SetBlendShapeWeight(i, 0f);

//         string shapekeyName = shapekey
//             .ToString()
//             .Replace("_", ".")
//             .Replace(".Cry.1", ".cry-1")
//             .Replace(".Cry.2", ".cry-2")
//             .ToLower();
//         int index = smr.sharedMesh.GetBlendShapeIndex(shapekeyName);

//         if (index >= 0 && index < smr.sharedMesh.blendShapeCount)
//             smr.SetBlendShapeWeight(index, 100f);
//         else
//             Debug.LogWarning($"[Shapekey] Blendshape not found: {shapekeyName}");
//     }

//     private void PlayDialogueAudio(AudioClip clip)
//     {
//         if (clip != null)
//         {
//             audioSource.clip = clip;
//             audioSource.Play();
//         }
//     }

//     private void EndStory()
//     {
//         SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
//     }

//     public void ActivateCharacters()
//     {
//         foreach (var speaker in dialogueData.sceneCharacters)
//         {
//             if (characterObjects.TryGetValue(speaker, out var obj))
//                 obj.SetActive(true);

//             if (dialogueBubbles.TryGetValue(speaker, out var bubble))
//                 bubble.SetActive(false);

//             if (meshRenderers.TryGetValue(speaker, out var smr))
//                 StartBlinking(speaker, smr);
//         }
//     }

//     private IEnumerator ResetAndShowWorldSpaceText(TextMeshProUGUI textBox, string text)
//     {
//         yield return null; // Allow deactivate to register

//         textBox.gameObject.SetActive(true); // Now activate again
//         textBox.text = text;
//         textBox.ForceMeshUpdate();

//         var canvas = textBox.GetComponentInParent<Canvas>();
//         if (canvas != null)
//             Canvas.ForceUpdateCanvases();

//         LayoutRebuilder.ForceRebuildLayoutImmediate((RectTransform)textBox.transform);
//     }
// }

// using System.Collections;
// using System.Collections.Generic;
// using TMPro;
// using UnityEngine;
// using UnityEngine.InputSystem;
// using UnityEngine.SceneManagement;

// public class DragonPepeLanaManager : MonoBehaviour
// {
//     private bool hasStarted = false;
//     public bool useDragon;
//     public bool usePiranha;
//     public bool useIguana;
//     public bool useGorilla;
//     public bool useMonkey;
//     public bool usePanther;

//     public GameObject piranhaBubble;
//     public GameObject dragonBubble;
//     public GameObject iguanaBubble;
//     public TextMeshProUGUI piranhaText;
//     public TextMeshProUGUI dragonText;
//     public TextMeshProUGUI iguanaText;
//     public AudioSource audioSource;

//     public GameObject piranha;
//     public GameObject dragon;
//     public GameObject iguana;
//     public AudioClip[] dialogueAudioClips;

//     private float lastClickTime = 0f;
//     private float doubleClickTimeThreshold = 0.3f; // Time threshold for double click detection

//     // Reference to the ScriptableObject containing dialogue data
//     public DialogueData dialogueData;

//     // The global array of prefab-with-position pairs, assigned in the Inspector.
//     public PrefabWithPosition[] globalPrefabEntries;

//     private Queue<DialogueLine> dialogueQueue;
//     private Stack<DialogueLine> dialogueHistory;
//     private bool isDialogueActive = false;

//     private Animator piranhaAnimator;
//     private Animator dragonAnimator;
//     private Animator iguanaAnimator;

//     public SkinnedMeshRenderer piranhaMeshRenderer;
//     public SkinnedMeshRenderer dragonMeshRenderer;
//     public SkinnedMeshRenderer iguanaMeshRenderer;

//     // If multiple prefabs can appear at once, track them all.
//     private List<GameObject> currentModelInstances = new List<GameObject>();

//     void Start()
//     {
//         dialogueQueue = new Queue<DialogueLine>();
//         dialogueHistory = new Stack<DialogueLine>();

//         piranhaBubble.SetActive(false);
//         dragonBubble.SetActive(false);
//         iguanaBubble.SetActive(false);

//         ActivateCharacters();
//         InitializeDialogue();
//         DisplayNextLine();

//         piranhaAnimator = piranha.GetComponent<Animator>();
//         dragonAnimator = dragon.GetComponent<Animator>();
//         iguanaAnimator = iguana.GetComponent<Animator>();

//         // Pass both the correct SkinnedMeshRenderer and the enum value.
//         StartCoroutine(BlinkCoroutine(piranhaMeshRenderer, DialogueLine.Speaker.PIRANHA));
//         StartCoroutine(BlinkCoroutine(dragonMeshRenderer, DialogueLine.Speaker.DRAGON));
//         StartCoroutine(BlinkCoroutine(iguanaMeshRenderer, DialogueLine.Speaker.IGUANA));
//     }

//     void Update()
//     {
//         if (Input.GetMouseButtonDown(0))
//         {

//                 DisplayNextLine(); // 👈 Start dialogue only after first click
//                 return;
//             }

//             if (isDialogueActive)
//             {
//                 float timeSinceLastClick = Time.time - lastClickTime;

//                 if (timeSinceLastClick <= doubleClickTimeThreshold)
//                 {
//                     if (dialogueHistory.Count > 0)
//                         DisplayPreviousLine();
//                 }
//                 else
//                 {
//                     DisplayNextLine();
//                 }

//                 lastClickTime = Time.time;
//             }
//         }
//     }

//     //     void Update()
//     // {
//     //     if (Input.GetMouseButtonDown(0))
//     //     {
//     //         if (!hasStarted)
//     //         {
//     //             hasStarted = true;
//     //             DisplayNextLine(); // Start the dialogue AFTER first click
//     //             return;
//     //         }

//     //         if (isDialogueActive)
//     //         {
//     //             float timeSinceLastClick = Time.time - lastClickTime;

//     //             if (timeSinceLastClick <= doubleClickTimeThreshold)
//     //             {
//     //                 // Double click - go back
//     //                 if (dialogueHistory.Count > 0)
//     //                 {
//     //                     DisplayPreviousLine();
//     //                 }
//     //             }
//     //             else
//     //             {
//     //                 // Single click - go forward
//     //                 DisplayNextLine();
//     //             }

//     //             lastClickTime = Time.time;
//     //         }
//     //     }
//     // }

//     // Instead of hardcoding dialogue, load it from the ScriptableObject
//     private void InitializeDialogue()
//     {
//         foreach (DialogueLine line in dialogueData.dialogueLines)
//         {
//             dialogueQueue.Enqueue(line);
//         }
//     }

//     public void DisplayNextLine()
//     {
//         if (dialogueQueue.Count == 0)
//         {
//             EndStory();
//             return;
//         }

//         if (dialogueHistory.Count == 0 || dialogueHistory.Peek().text != GetCurrentText())
//         {
//             dialogueHistory.Push(
//                 new DialogueLine { speaker = GetCurrentSpeaker(), text = GetCurrentText() }
//             );
//         }

//         DialogueLine line = dialogueQueue.Dequeue();
//         DisplayLine(line);
//     }

//     private void DisplayPreviousLine()
//     {
//         DialogueLine line = dialogueHistory.Pop();
//         DisplayLine(line);
//     }

//     private void DisplayLine(DialogueLine line)
//     {
//         // Destroy any previously instantiated prefabs.
//         foreach (var instance in currentModelInstances)
//         {
//             Destroy(instance);
//         }
//         currentModelInstances.Clear();

//         // Instantiate each prefab referenced by this line.
//         foreach (int index in line.prefabIndices)
//         {
//             if (index >= 0 && index < globalPrefabEntries.Length)
//             {
//                 PrefabWithPosition entry = globalPrefabEntries[index];
//                 if (entry.prefab != null)
//                 {
//                     GameObject spawned = Instantiate(
//                         entry.prefab,
//                         entry.position,
//                         Quaternion.identity
//                     );
//                     spawned.transform.localScale = entry.scale;
//                     currentModelInstances.Add(spawned);
//                     StartCoroutine(SpinPrefab(spawned, 30f));
//                 }
//             }
//             else
//             {
//                 Debug.LogWarning("Prefab index out of range: " + index);
//             }
//         }

//         // Reset all bubbles.
//         piranhaBubble.SetActive(false);
//         dragonBubble.SetActive(false);
//         iguanaBubble.SetActive(false);

//         Animator speakingAnimator = GetSpeakingAnimator(line.speaker);

//         // Use the enum value to decide which bubble to show.
//         switch (line.speaker)
//         {
//             case DialogueLine.Speaker.PIRANHA:
//                 piranhaBubble.SetActive(true);
//                 SetText(piranhaText, line.text, true);
//                 break;
//             case DialogueLine.Speaker.DRAGON:
//                 dragonBubble.SetActive(true);
//                 SetText(dragonText, line.text, true);
//                 break;
//             case DialogueLine.Speaker.IGUANA:
//                 iguanaBubble.SetActive(true);
//                 SetText(iguanaText, line.text, true);
//                 break;
//             default:
//                 Debug.LogError("Speaker not found: " + line.speaker);
//                 break;
//         }

//         PlayDialogueAudio(line.audioClip);
//         isDialogueActive = true;

//         // Set the speaking character's animation and shapekey.
//         ChangeAnimation(speakingAnimator, line.animationName);
//         ChangeShapekey(GetMeshRendererForCharacter(line.speaker), line.shapekeyName);

//         // Apply non-speaking character actions.
//         ApplyNonSpeakingCharacterActions(line);

//         // Use the enum-based default state.
//         StartCoroutine(
//             ReturnToDefaultStateAfterSpeaking(speakingAnimator, GetDefaultState(line.speaker))
//         );
//     }

//     // Coroutine to spin a prefab around the y-axis.
//     private IEnumerator SpinPrefab(GameObject obj, float spinSpeed)
//     {
//         while (obj != null)
//         {
//             obj.transform.Rotate(Vector3.up, spinSpeed * Time.deltaTime);
//             yield return null;
//         }
//     }

//     private IEnumerator ReturnToDefaultStateAfterSpeaking(
//         Animator animator,
//         DialogueLine.AnimationName defaultState
//     )
//     {
//         yield return new WaitForSeconds(audioSource.clip.length);
//         ChangeAnimation(animator, defaultState);
//     }

//     //Returns a default animation state based on the speaker.
//     private DialogueLine.AnimationName GetDefaultState(DialogueLine.Speaker speaker)
//     {
//         switch (speaker)
//         {
//             case DialogueLine.Speaker.PIRANHA:
//                 return DialogueLine.AnimationName.Swim;
//             case DialogueLine.Speaker.DRAGON:
//                 return DialogueLine.AnimationName.Fly;
//             case DialogueLine.Speaker.IGUANA:
//                 return DialogueLine.AnimationName.Sit;
//             default:
//                 return DialogueLine.AnimationName.Sit;
//         }
//     }

//     // -------------------------
//     // Blinking Functions
//     // -------------------------
//     private Dictionary<DialogueLine.Speaker, Coroutine> blinkCoroutines =
//         new Dictionary<DialogueLine.Speaker, Coroutine>();

//     private void StartBlinking(DialogueLine.Speaker speaker, SkinnedMeshRenderer meshRenderer)
//     {
//         if (blinkCoroutines.ContainsKey(speaker) && blinkCoroutines[speaker] != null)
//         {
//             StopCoroutine(blinkCoroutines[speaker]);
//         }
//         blinkCoroutines[speaker] = StartCoroutine(BlinkCoroutine(meshRenderer, speaker));
//     }

//     private void StopBlinking(DialogueLine.Speaker speaker)
//     {
//         if (blinkCoroutines.ContainsKey(speaker) && blinkCoroutines[speaker] != null)
//         {
//             StopCoroutine(blinkCoroutines[speaker]);
//             blinkCoroutines[speaker] = null;
//         }
//     }

//     private IEnumerator BlinkCoroutine(
//         SkinnedMeshRenderer meshRenderer,
//         DialogueLine.Speaker speaker
//     )
//     {
//         if (meshRenderer == null || meshRenderer.sharedMesh == null)
//         {
//             Debug.LogWarning(
//                 "BlinkCoroutine: SkinnedMeshRenderer or its sharedMesh is null for " + speaker
//             );
//             yield break;
//         }

//         int blinkIndex = (int)DialogueLine.ShapekeyName.Eyes_Blink;
//         while (true)
//         {
//             if (blinkIndex >= 0 && blinkIndex < meshRenderer.sharedMesh.blendShapeCount)
//             {
//                 meshRenderer.SetBlendShapeWeight(blinkIndex, 100f);
//                 yield return new WaitForSeconds(0.1f);
//                 meshRenderer.SetBlendShapeWeight(blinkIndex, 0f);
//             }
//             float blinkInterval = Random.Range(5f, 10f);
//             yield return new WaitForSeconds(blinkInterval);
//         }
//     }

//     private string GetDefaultEyeState(Animator animator)
//     {
//         return "Eyes_Open";
//     }

//     // -------------------------
//     // Helper Functions for Getting Components
//     // -------------------------

//     private Animator GetSpeakingAnimator(DialogueLine.Speaker speaker)
//     {
//         switch (speaker)
//         {
//             case DialogueLine.Speaker.PIRANHA:
//                 return piranhaAnimator;
//             case DialogueLine.Speaker.DRAGON:
//                 return dragonAnimator;
//             case DialogueLine.Speaker.IGUANA:
//                 return iguanaAnimator;
//             default:
//                 return null;
//         }
//     }

//     private DialogueLine.Speaker GetCurrentSpeaker()
//     {
//         if (piranhaText.gameObject.activeSelf)
//             return DialogueLine.Speaker.PIRANHA;
//         if (dragonText.gameObject.activeSelf)
//             return DialogueLine.Speaker.DRAGON;
//         if (iguanaText.gameObject.activeSelf)
//             return DialogueLine.Speaker.IGUANA;
//         return DialogueLine.Speaker.PIRANHA; // Default value.
//     }

//     private string GetCurrentText()
//     {
//         if (piranhaText.gameObject.activeSelf)
//             return piranhaText.text;
//         if (dragonText.gameObject.activeSelf)
//             return dragonText.text;
//         if (iguanaText.gameObject.activeSelf)
//             return iguanaText.text;
//         return "";
//     }

//     private void SetText(TextMeshProUGUI textComponent, string text, bool active)
//     {
//         textComponent.text = text;
//         textComponent.gameObject.SetActive(active);
//     }

//     private void PlayDialogueAudio(AudioClip clip)
//     {
//         if (clip != null)
//         {
//             audioSource.clip = clip;
//             audioSource.Play();
//         }
//         else
//         {
//             Debug.LogWarning("No audio clip found for current dialogue line.");
//         }
//     }

//     private void EndStory()
//     {
//         Debug.Log("Story ended.");
//         int currentSceneIndex = SceneManager.GetActiveScene().buildIndex;
//         SceneManager.LoadScene(currentSceneIndex + 1);
//     }

//     public void ActivateCharacters()
//     {
//         piranha.SetActive(true);
//         dragon.SetActive(true);
//         iguana.SetActive(true);
//     }

//     private Animator GetAnimatorForCharacter(DialogueLine.Speaker character)
//     {
//         switch (character)
//         {
//             case DialogueLine.Speaker.PIRANHA:
//                 return piranhaAnimator;
//             case DialogueLine.Speaker.IGUANA:
//                 return iguanaAnimator;
//             case DialogueLine.Speaker.DRAGON:
//                 return dragonAnimator;
//             default:
//                 return null;
//         }
//     }

//     private SkinnedMeshRenderer GetMeshRendererForCharacter(DialogueLine.Speaker character)
//     {
//         switch (character)
//         {
//             case DialogueLine.Speaker.PIRANHA:
//                 return piranhaMeshRenderer;
//             case DialogueLine.Speaker.IGUANA:
//                 return iguanaMeshRenderer;
//             case DialogueLine.Speaker.DRAGON:
//                 return dragonMeshRenderer;
//             default:
//                 return null;
//         }
//     }

//     // -------------------------
//     // Animation and Shapekey Changes
//     // -------------------------
//     public void ChangeAnimation(Animator animator, DialogueLine.AnimationName animationName)
//     {
//         if (animator != null)
//         {
//             string animState = animationName.ToString();
//             if (animator.HasState(0, Animator.StringToHash(animState)))
//             {
//                 animator.Play(animState, 0);
//             }
//             else
//             {
//                 Debug.LogWarning("Animation state not found: " + animState);
//             }
//         }
//     }

//     public void ChangeShapekey(
//         SkinnedMeshRenderer meshRenderer,
//         DialogueLine.ShapekeyName shapekeyName
//     )
//     {
//         if (meshRenderer != null)
//         {
//             if (shapekeyName == DialogueLine.ShapekeyName.None)
//                 return;
//             // Reset all shapekeys.
//             for (int i = 0; i < meshRenderer.sharedMesh.blendShapeCount; i++)
//             {
//                 meshRenderer.SetBlendShapeWeight(i, 0f);
//             }
//             int index = (int)shapekeyName;
//             if (index >= 0 && index < meshRenderer.sharedMesh.blendShapeCount)
//             {
//                 meshRenderer.SetBlendShapeWeight(index, 100f);
//             }
//             else
//             {
//                 Debug.LogError("Shapekey not found on this character: " + shapekeyName);
//             }
//         }
//     }

//     // -------------------------
//     // Non-Speaking Character Actions
//     // -------------------------
//     private void ApplyNonSpeakingCharacterActions(DialogueLine line)
//     {
//         // Loop through all speakers.
//         foreach (
//             DialogueLine.Speaker character in System.Enum.GetValues(typeof(DialogueLine.Speaker))
//         )
//         {
//             if (character == line.speaker)
//                 continue;

//             DialogueLine.CharacterAction action = line.nonSpeakingCharacterActions.Find(a =>
//                 a.character == character
//             );
//             Animator anim = GetAnimatorForCharacter(character);
//             SkinnedMeshRenderer meshRenderer = GetMeshRendererForCharacter(character);

//             if (action != null)
//             {
//                 if (action.animation != DialogueLine.AnimationName.None)
//                 {
//                     ChangeAnimation(anim, action.animation);
//                 }
//                 else
//                 {
//                     // Use default idle animation.
//                     ChangeAnimation(anim, line.GetDefaultIdleAnimation(character));
//                 }

//                 if (action.shapekey != DialogueLine.ShapekeyName.None)
//                 {
//                     StopBlinking(character);
//                     ChangeShapekey(meshRenderer, action.shapekey);
//                 }
//                 else
//                 {
//                     StartBlinking(character, meshRenderer);
//                 }
//             }
//             else
//             {
//                 // No action defined: revert to default idle and start blinking.
//                 ChangeAnimation(anim, line.GetDefaultIdleAnimation(character));
//                 StartBlinking(character, meshRenderer);
//             }
//         }
//     }
// }
