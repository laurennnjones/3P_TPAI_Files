#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using UnityEditorInternal;
using System.Reflection; // ✅ Add this line

[CustomEditor(typeof(DialogueData))]
public class DialogueDataEditor : Editor
{
    private void AutoAssignAudioByOrder(DialogueData data, string folderPath)
    {
        string[] guids = AssetDatabase.FindAssets("t:AudioClip", new[] { folderPath });
        List<AudioClip> sortedClips = new List<AudioClip>();

        foreach (string guid in guids)
        {
            string assetPath = AssetDatabase.GUIDToAssetPath(guid);
            AudioClip clip = AssetDatabase.LoadAssetAtPath<AudioClip>(assetPath);
            sortedClips.Add(clip);
        }

        sortedClips.Sort((a, b) => a.name.CompareTo(b.name)); // alphabetical sort

        for (int i = 0; i < data.dialogueLines.Count && i < sortedClips.Count; i++)
        {
            data.dialogueLines[i].audioClip = sortedClips[i];
        }

        EditorUtility.SetDirty(data);
        AssetDatabase.SaveAssets();
        Debug.Log("✅ Audio clips assigned by order.");
    }

    public override void OnInspectorGUI()
    {
        DialogueData data = (DialogueData)target;

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("🎤 Dialogue Lines", EditorStyles.boldLabel);

        if (data.dialogueLines == null)
        {
            data.dialogueLines = new List<DialogueLine>();
        }

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("🎭 Scene Characters");

        EditorGUILayout.BeginHorizontal();
        for (int i = 0; i < data.sceneCharacters.Count; i++)
        {
            data.sceneCharacters[i] = (DialogueLine.Speaker)
                EditorGUILayout.EnumPopup(data.sceneCharacters[i], GUILayout.Width(110));
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("➕ Add Character", GUILayout.Width(140)))
        {
            data.sceneCharacters.Add(DialogueLine.Speaker.DRAGON);
        }
        if (GUILayout.Button("🧹 Clear All", GUILayout.Width(100)))
        {
            data.sceneCharacters.Clear();
        }
        EditorGUILayout.EndHorizontal();

        for (int i = 0; i < data.dialogueLines.Count; i++)
        {
            DialogueLine line = data.dialogueLines[i];
            EditorGUILayout.BeginVertical("box");

            // Line label and buttons
            EditorGUILayout.BeginHorizontal();
            Color originalColor = GUI.color;
            GUI.color = GetColorForSpeaker(line.speaker);
            EditorGUILayout.LabelField($"Line {i + 1}", EditorStyles.boldLabel);
            GUI.color = originalColor;

            if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
            {
                var temp = data.dialogueLines[i];
                data.dialogueLines[i] = data.dialogueLines[i - 1];
                data.dialogueLines[i - 1] = temp;
            }
            if (GUILayout.Button("▼", GUILayout.Width(25)) && i < data.dialogueLines.Count - 1)
            {
                var temp = data.dialogueLines[i];
                data.dialogueLines[i] = data.dialogueLines[i + 1];
                data.dialogueLines[i + 1] = temp;
            }
            if (GUILayout.Button("❌", GUILayout.Width(25)))
            {
                data.dialogueLines.RemoveAt(i);
                break;
            }
            EditorGUILayout.EndHorizontal();

            // Main Row: Speaker, Text, Audio, Animation, Shapekey
            EditorGUILayout.BeginHorizontal();
            line.speaker = (DialogueLine.Speaker)
                EditorGUILayout.EnumPopup(line.speaker, GUILayout.Width(90));
            line.text = EditorGUILayout.TextField(line.text, GUILayout.MinWidth(200));
            line.audioClip = (AudioClip)
                EditorGUILayout.ObjectField(
                    line.audioClip,
                    typeof(AudioClip),
                    false,
                    GUILayout.Width(180)
                );
            line.animationName = (DialogueLine.AnimationName)
                EditorGUILayout.EnumPopup(line.animationName, GUILayout.Width(100));
            line.shapekeyName = (DialogueLine.ShapekeyName)
                EditorGUILayout.EnumPopup(line.shapekeyName, GUILayout.Width(100));
            EditorGUILayout.EndHorizontal();

            // Audio playback
            if (line.audioClip != null)
            {
                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("▶ Play"))
                    PlayClip(line.audioClip);
                if (GUILayout.Button("■ Stop"))
                    StopAllClips();
                EditorGUILayout.EndHorizontal();
            }

            // Prefab indices list
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("📦 Prefabs to Spawn", GUILayout.Width(150));
            for (int j = 0; j < line.prefabIndices.Count; j++)
            {
                line.prefabIndices[j] = EditorGUILayout.IntField(
                    line.prefabIndices[j],
                    GUILayout.Width(50)
                );
                if (GUILayout.Button("❌", GUILayout.Width(25)))
                {
                    line.prefabIndices.RemoveAt(j);
                    break;
                }
            }
            if (GUILayout.Button("➕", GUILayout.Width(25)))
            {
                line.prefabIndices.Add(0);
            }
            EditorGUILayout.EndHorizontal();

            // Non-speaking character actions
            EditorGUILayout.Space();
            EditorGUILayout.LabelField("🎭 Non-Speaking Character Actions");

            foreach (DialogueLine.Speaker character in data.sceneCharacters)
            {
                if (character == line.speaker)
                    continue;

                DialogueLine.CharacterAction existingAction = line.nonSpeakingCharacterActions.Find(
                    a => a.character == character
                );
                if (existingAction == null)
                {
                    existingAction = new DialogueLine.CharacterAction { character = character };
                    line.nonSpeakingCharacterActions.Add(existingAction);
                }

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField(character.ToString(), GUILayout.Width(70));
                existingAction.animation = (DialogueLine.AnimationName)
                    EditorGUILayout.EnumPopup(existingAction.animation, GUILayout.Width(100));
                existingAction.shapekey = (DialogueLine.ShapekeyName)
                    EditorGUILayout.EnumPopup(existingAction.shapekey, GUILayout.Width(100));
                EditorGUILayout.EndHorizontal();
            }

            EditorGUILayout.EndVertical();
        }

        EditorGUILayout.Space();

        if (GUILayout.Button("➕ Add New Line"))
        {
            data.dialogueLines.Add(new DialogueLine());
        }

        EditorGUILayout.Space();

        if (GUILayout.Button("📥 Load Dialogue From CSV"))
        {
            string path = EditorUtility.OpenFilePanel("Select Dialogue CSV", "", "csv");
            if (!string.IsNullOrEmpty(path))
            {
                string csvText = File.ReadAllText(path);
                List<DialogueLine> lines = ParseCSV(csvText);
                data.dialogueLines = lines;
                EditorUtility.SetDirty(data);
                AssetDatabase.SaveAssets();
                Debug.Log("Dialogue loaded and asset saved.");
            }
        }

        if (GUILayout.Button("🎧 Auto-Assign Audio (Ordered)"))
        {
            string folderPath = EditorUtility.OpenFolderPanel(
                "Select Audio Folder",
                Application.dataPath,
                ""
            );
            if (!string.IsNullOrEmpty(folderPath) && folderPath.StartsWith(Application.dataPath))
            {
                string relativePath = "Assets" + folderPath.Substring(Application.dataPath.Length);
                AutoAssignAudioByOrder(data, relativePath);
            }
            else
            {
                Debug.LogWarning("Please select a folder within the Assets directory.");
            }
        }

        if (GUI.changed)
        {
            EditorUtility.SetDirty(data);
        }
    }

    // public override void OnInspectorGUI()
    // {
    //     DialogueData data = (DialogueData)target;

    //     EditorGUILayout.Space();
    //     EditorGUILayout.LabelField("🎤 Dialogue Lines", EditorStyles.boldLabel);

    //     if (data.dialogueLines == null)
    //     {
    //         data.dialogueLines = new List<DialogueLine>();
    //     }

    //     for (int i = 0; i < data.dialogueLines.Count; i++)
    //     {
    //         DialogueLine line = data.dialogueLines[i];
    //         EditorGUILayout.BeginVertical("box");

    //         // Line label with color and buttons on the right
    //         EditorGUILayout.BeginHorizontal();
    //         Color originalColor = GUI.color;
    //         GUI.color = GetColorForSpeaker(line.speaker);
    //         EditorGUILayout.LabelField($"Line {i + 1}", EditorStyles.boldLabel);
    //         GUI.color = originalColor;

    //         if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
    //         {
    //             var temp = data.dialogueLines[i];
    //             data.dialogueLines[i] = data.dialogueLines[i - 1];
    //             data.dialogueLines[i - 1] = temp;
    //         }
    //         if (GUILayout.Button("▼", GUILayout.Width(25)) && i < data.dialogueLines.Count - 1)
    //         {
    //             var temp = data.dialogueLines[i];
    //             data.dialogueLines[i] = data.dialogueLines[i + 1];
    //             data.dialogueLines[i + 1] = temp;
    //         }
    //         if (GUILayout.Button("❌", GUILayout.Width(25)))
    //         {
    //             data.dialogueLines.RemoveAt(i);
    //             break;
    //         }
    //         EditorGUILayout.EndHorizontal();

    //         // All inputs in one row: Speaker, Text (single-line), Audio, Animation, Shapekey
    //         EditorGUILayout.BeginHorizontal();

    //         line.speaker = (DialogueLine.Speaker)
    //             EditorGUILayout.EnumPopup(line.speaker, GUILayout.Width(90));
    //         line.text = EditorGUILayout.TextField(line.text, GUILayout.MinWidth(200));
    //         line.audioClip = (AudioClip)
    //             EditorGUILayout.ObjectField(
    //                 line.audioClip,
    //                 typeof(AudioClip),
    //                 false,
    //                 GUILayout.Width(180)
    //             );
    //         line.animationName = (DialogueLine.AnimationName)
    //             EditorGUILayout.EnumPopup(line.animationName, GUILayout.Width(100));
    //         line.shapekeyName = (DialogueLine.ShapekeyName)
    //             EditorGUILayout.EnumPopup(line.shapekeyName, GUILayout.Width(100));

    //         EditorGUILayout.EndHorizontal();

    //         // Optional: audio controls
    //         if (line.audioClip != null)
    //         {
    //             EditorGUILayout.BeginHorizontal();
    //             if (GUILayout.Button("▶ Play"))
    //                 PlayClip(line.audioClip);
    //             if (GUILayout.Button("■ Stop"))
    //                 StopAllClips();
    //             EditorGUILayout.EndHorizontal();
    //         }

    //         EditorGUILayout.EndVertical();
    //     }

    //     // ⬇️ These actions are OUTSIDE the loop
    //     EditorGUILayout.Space();

    //     if (GUILayout.Button("➕ Add New Line"))
    //     {
    //         data.dialogueLines.Add(new DialogueLine());
    //     }

    //     EditorGUILayout.Space();

    //     if (GUILayout.Button("📥 Load Dialogue From CSV"))
    //     {
    //         string path = EditorUtility.OpenFilePanel("Select Dialogue CSV", "", "csv");
    //         if (!string.IsNullOrEmpty(path))
    //         {
    //             string csvText = File.ReadAllText(path);
    //             List<DialogueLine> lines = ParseCSV(csvText);
    //             data.dialogueLines = lines;
    //             EditorUtility.SetDirty(data);
    //             AssetDatabase.SaveAssets();
    //             Debug.Log("Dialogue loaded and asset saved.");
    //         }
    //     }

    //     if (GUI.changed)
    //     {
    //         EditorUtility.SetDirty(data);
    //     }
    // }

    // public override void OnInspectorGUI()
    // {
    //     DialogueData data = (DialogueData)target;

    //     EditorGUILayout.Space();
    //     EditorGUILayout.LabelField("🎤 Dialogue Lines", EditorStyles.boldLabel);

    //     if (data.dialogueLines == null)
    //     {
    //         data.dialogueLines = new List<DialogueLine>();
    //     }

    //     for (int i = 0; i < data.dialogueLines.Count; i++)
    //     {
    //         DialogueLine line = data.dialogueLines[i];

    //         GUI.color = GetColorForSpeaker(line.speaker);

    //         EditorGUILayout.BeginVertical("box");

    //         EditorGUILayout.BeginHorizontal();
    //         EditorGUILayout.LabelField($"Line {i + 1}", EditorStyles.boldLabel);
    //         if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
    //         {
    //             var temp = data.dialogueLines[i];
    //             data.dialogueLines[i] = data.dialogueLines[i - 1];
    //             data.dialogueLines[i - 1] = temp;
    //         }
    //         if (GUILayout.Button("▼", GUILayout.Width(25)) && i < data.dialogueLines.Count - 1)
    //         {
    //             var temp = data.dialogueLines[i];
    //             data.dialogueLines[i] = data.dialogueLines[i + 1];
    //             data.dialogueLines[i + 1] = temp;
    //         }
    //         if (GUILayout.Button("❌", GUILayout.Width(25)))
    //         {
    //             data.dialogueLines.RemoveAt(i);
    //             break;
    //         }
    //         EditorGUILayout.EndHorizontal();

    //         line.speaker = (DialogueLine.Speaker)EditorGUILayout.EnumPopup("Speaker", line.speaker);
    //         line.text = EditorGUILayout.TextArea(line.text, GUILayout.MinHeight(50));

    //         line.audioClip = (AudioClip)EditorGUILayout.ObjectField("Audio Clip", line.audioClip, typeof(AudioClip), false);

    //         if (line.audioClip != null)
    //         {
    //             EditorGUILayout.BeginHorizontal();
    //             if (GUILayout.Button("▶ Play"))
    //             {
    //                 PlayClip(line.audioClip);
    //             }
    //             if (GUILayout.Button("■ Stop"))
    //             {
    //                 StopAllClips();
    //             }
    //             EditorGUILayout.EndHorizontal();
    //         }

    //         line.animationName = (DialogueLine.AnimationName)EditorGUILayout.EnumPopup("Animation", line.animationName);
    //         line.shapekeyName = (DialogueLine.ShapekeyName)EditorGUILayout.EnumPopup("Shapekey", line.shapekeyName);

    //         EditorGUILayout.EndVertical();
    //         GUI.color = Color.white;
    //     }

    //     EditorGUILayout.Space();

    //     if (GUILayout.Button("➕ Add New Line"))
    //     {
    //         data.dialogueLines.Add(new DialogueLine());
    //     }

    //     EditorGUILayout.Space();

    //     if (GUILayout.Button("📥 Load Dialogue From CSV"))
    //     {
    //         string path = EditorUtility.OpenFilePanel("Select Dialogue CSV", "", "csv");
    //         if (!string.IsNullOrEmpty(path))
    //         {
    //             string csvText = File.ReadAllText(path);
    //             List<DialogueLine> lines = ParseCSV(csvText);
    //             data.dialogueLines = lines;
    //             EditorUtility.SetDirty(data);
    //             AssetDatabase.SaveAssets();
    //             Debug.Log("Dialogue loaded and asset saved.");
    //         }
    //     }

    //     if (GUI.changed)
    //     {
    //         EditorUtility.SetDirty(data);
    //     }
    // }

    private List<DialogueLine> ParseCSV(string csvText)
    {
        List<DialogueLine> lines = new List<DialogueLine>();

        string pattern = @"^\s*\""?(?<speaker>[^,""]+)\""?\s*,\s*\""?(?<text>[^""]*)\""?\s*$";
        Regex regex = new Regex(pattern);

        string[] records = csvText.Split(
            new char[] { '\n' },
            System.StringSplitOptions.RemoveEmptyEntries
        );

        int startIndex = 0;
        if (records.Length > 0)
        {
            string firstLine = records[0].Trim().ToLower();
            if (firstLine.Contains("speaker") && firstLine.Contains("text"))
            {
                startIndex = 1;
            }
        }

        for (int i = startIndex; i < records.Length; i++)
        {
            string record = records[i].Trim();
            if (string.IsNullOrEmpty(record))
                continue;

            Match match = regex.Match(record);
            if (match.Success)
            {
                DialogueLine line = new DialogueLine
                {
                    speaker = (DialogueLine.Speaker)
                        System.Enum.Parse(
                            typeof(DialogueLine.Speaker),
                            match.Groups["speaker"].Value.Trim(),
                            true
                        ),
                    text = match.Groups["text"].Value.Trim(),
                };
                lines.Add(line);
            }
            else
            {
                Debug.LogWarning("Skipping malformed CSV line: " + record);
            }
        }

        return lines;
    }

    private Color GetColorForSpeaker(DialogueLine.Speaker speaker)
    {
        switch (speaker)
        {
            case DialogueLine.Speaker.DRAGON:
                return new Color(1f, 0.6f, 0.6f); // Light red
            case DialogueLine.Speaker.PIRANHA:
                return new Color(0.5f, 0.8f, 1f); // Light blue
            case DialogueLine.Speaker.IGUANA:
                return new Color(0.6f, 1f, 0.6f); // Light green
            case DialogueLine.Speaker.GORILLA:
                return new Color(0.7f, 0.7f, 0.7f); // Light gray
            case DialogueLine.Speaker.MONKEY:
                return new Color(1f, 1f, 0.6f); // Yellow
            case DialogueLine.Speaker.PANTHER:
                return new Color(0.8f, 0.5f, 1f); // Purple
            default:
                return Color.white;
        }
    }

    private void PlayClip(AudioClip clip)
    {
        if (clip != null)
        {
            Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
            System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
            System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
                "PlayClip",
                System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public,
                null,
                new System.Type[] { typeof(AudioClip) },
                null
            );
            method.Invoke(null, new object[] { clip });
        }
    }

    private void StopAllClips()
    {
        Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
        System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
        System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
            "StopAllClips",
            System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public
        );
        method.Invoke(null, null);
    }
}
#endif

// #if UNITY_EDITOR
// using UnityEngine;
// using UnityEditor;
// using System.IO;
// using System.Collections.Generic;
// using System.Text.RegularExpressions;
// using UnityEditorInternal;
// using System.Reflection;


// [CustomEditor(typeof(DialogueData))]
// public class DialogueDataEditor : Editor
// {
//     public override void OnInspectorGUI()
//     {
//         DialogueData data = (DialogueData)target;

//         EditorGUILayout.Space();
//         EditorGUILayout.LabelField("🎤 Dialogue Lines", EditorStyles.boldLabel);

//         if (data.dialogueLines == null)
//         {
//             data.dialogueLines = new List<DialogueLine>();
//         }

//         for (int i = 0; i < data.dialogueLines.Count; i++)
//         {
//             DialogueLine line = data.dialogueLines[i];

//             GUI.color = GetColorForSpeaker(line.speaker);

//             EditorGUILayout.BeginVertical("box");

//             EditorGUILayout.BeginHorizontal();
//             EditorGUILayout.LabelField($"Line {i + 1}", EditorStyles.boldLabel);
//             if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
//             {
//                 var temp = data.dialogueLines[i];
//                 data.dialogueLines[i] = data.dialogueLines[i - 1];
//                 data.dialogueLines[i - 1] = temp;
//             }
//             if (GUILayout.Button("▼", GUILayout.Width(25)) && i < data.dialogueLines.Count - 1)
//             {
//                 var temp = data.dialogueLines[i];
//                 data.dialogueLines[i] = data.dialogueLines[i + 1];
//                 data.dialogueLines[i + 1] = temp;
//             }
//             if (GUILayout.Button("❌", GUILayout.Width(25)))
//             {
//                 data.dialogueLines.RemoveAt(i);
//                 break;
//             }
//             EditorGUILayout.EndHorizontal();

//             line.speaker = (DialogueLine.Speaker)EditorGUILayout.EnumPopup("Speaker", line.speaker);
//             line.text = EditorGUILayout.TextArea(line.text, GUILayout.MinHeight(50));

//             line.audioClip = (AudioClip)EditorGUILayout.ObjectField("Audio Clip", line.audioClip, typeof(AudioClip), false);

//             if (line.audioClip != null)
//             {
//                 EditorGUILayout.BeginHorizontal();
//                 if (GUILayout.Button("▶ Play"))
//                 {
//                     PlayClip(line.audioClip);
//                 }
//                 if (GUILayout.Button("■ Stop"))
//                 {
//                     StopAllClips();
//                 }
//                 EditorGUILayout.EndHorizontal();
//             }

//             line.animationName = (DialogueLine.AnimationName)EditorGUILayout.EnumPopup("Animation", line.animationName);
//             line.shapekeyName = (DialogueLine.ShapekeyName)EditorGUILayout.EnumPopup("Shapekey", line.shapekeyName);

//             EditorGUILayout.EndVertical();
//             GUI.color = Color.white;
//         }

//         EditorGUILayout.Space();

//         if (GUILayout.Button("➕ Add New Line"))
//         {
//             data.dialogueLines.Add(new DialogueLine());
//         }

//         EditorGUILayout.Space();

//         if (GUILayout.Button("📥 Load Dialogue From CSV"))
//         {
//             string path = EditorUtility.OpenFilePanel("Select Dialogue CSV", "", "csv");
//             if (!string.IsNullOrEmpty(path))
//             {
//                 string csvText = File.ReadAllText(path);
//                 List<DialogueLine> lines = ParseCSV(csvText);
//                 data.dialogueLines = lines;
//                 EditorUtility.SetDirty(data);
//                 AssetDatabase.SaveAssets();
//                 Debug.Log("Dialogue loaded and asset saved.");
//             }
//         }

//         if (GUI.changed)
//         {
//             EditorUtility.SetDirty(data);
//         }
//     }

//     private List<DialogueLine> ParseCSV(string csvText)
//     {
//         List<DialogueLine> lines = new List<DialogueLine>();

//         string pattern = @"^\s*\""?(?<speaker>[^,""]+)\""?\s*,\s*\""?(?<text>[^""]*)\""?\s*$";
//         Regex regex = new Regex(pattern);

//         string[] records = csvText.Split(new char[] { '\n' }, System.StringSplitOptions.RemoveEmptyEntries);

//         int startIndex = 0;
//         if (records.Length > 0)
//         {
//             string firstLine = records[0].Trim().ToLower();
//             if (firstLine.Contains("speaker") && firstLine.Contains("text"))
//             {
//                 startIndex = 1;
//             }
//         }

//         for (int i = startIndex; i < records.Length; i++)
//         {
//             string record = records[i].Trim();
//             if (string.IsNullOrEmpty(record))
//                 continue;

//             Match match = regex.Match(record);
//             if (match.Success)
//             {
//                 DialogueLine line = new DialogueLine
//                 {
//                     speaker = (DialogueLine.Speaker)System.Enum.Parse(
//                         typeof(DialogueLine.Speaker),
//                         match.Groups["speaker"].Value.Trim(),
//                         true),
//                     text = match.Groups["text"].Value.Trim()
//                 };
//                 lines.Add(line);
//             }
//             else
//             {
//                 Debug.LogWarning("Skipping malformed CSV line: " + record);
//             }
//         }

//         return lines;
//     }

//     private Color GetColorForSpeaker(DialogueLine.Speaker speaker)
//     {
//         switch (speaker)
//         {
//             case DialogueLine.Speaker.DRAGON:
//                 return new Color(1f, 0.6f, 0.6f); // Light red
//             case DialogueLine.Speaker.PIRANHA:
//                 return new Color(0.5f, 0.8f, 1f); // Light blue
//             case DialogueLine.Speaker.IGUANA:
//                 return new Color(0.6f, 1f, 0.6f); // Light green
//             case DialogueLine.Speaker.GORILLA:
//                 return new Color(0.7f, 0.7f, 0.7f); // Light gray
//             case DialogueLine.Speaker.MONKEY:
//                 return new Color(1f, 1f, 0.6f); // Yellow
//             case DialogueLine.Speaker.PANTHER:
//                 return new Color(0.8f, 0.5f, 1f); // Purple
//             default:
//                 return Color.white;
//         }
//     }

//     private void PlayClip(AudioClip clip)
//     {
//         if (clip != null)
//         {
//             Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
//             System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
//             System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
//                 "PlayClip",
//                 System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public,
//                 null,
//                 new System.Type[] { typeof(AudioClip) },
//                 null
//             );
//             method.Invoke(null, new object[] { clip });
//         }
//     }

//     private void StopAllClips()
//     {
//         Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
//         System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
//         System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
//             "StopAllClips",
//             System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public
//         );
//         method.Invoke(null, null);
//     }
// }
// #endif


// #if UNITY_EDITOR
// using UnityEngine;
// using UnityEditor;
// using System.IO;
// using System.Collections.Generic;
// using System.Text.RegularExpressions;
// using UnityEditorInternal;

// [CustomEditor(typeof(DialogueData))]
// public class DialogueDataEditor : Editor
// {
//     public override void OnInspectorGUI()
//     {
//         DialogueData data = (DialogueData)target;

//         EditorGUILayout.Space();
//         EditorGUILayout.LabelField("🎤 Dialogue Lines", EditorStyles.boldLabel);

//         if (data.dialogueLines == null)
//         {
//             data.dialogueLines = new List<DialogueLine>();
//         }

//         for (int i = 0; i < data.dialogueLines.Count; i++)
//         {
//             DialogueLine line = data.dialogueLines[i];

//             GUI.color = GetColorForSpeaker(line.speaker);

//             EditorGUILayout.BeginVertical("box");

//             EditorGUILayout.BeginHorizontal();
//             EditorGUILayout.LabelField($"Line {i + 1}", EditorStyles.boldLabel);
//             if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
//             {
//                 var temp = data.dialogueLines[i];
//                 data.dialogueLines[i] = data.dialogueLines[i - 1];
//                 data.dialogueLines[i - 1] = temp;
//             }
//             if (GUILayout.Button("▼", GUILayout.Width(25)) && i < data.dialogueLines.Count - 1)
//             {
//                 var temp = data.dialogueLines[i];
//                 data.dialogueLines[i] = data.dialogueLines[i + 1];
//                 data.dialogueLines[i + 1] = temp;
//             }
//             if (GUILayout.Button("❌", GUILayout.Width(25)))
//             {
//                 data.dialogueLines.RemoveAt(i);
//                 break;
//             }
//             EditorGUILayout.EndHorizontal();

//             line.speaker = (DialogueLine.Speaker)EditorGUILayout.EnumPopup("Speaker", line.speaker);
//             line.text = EditorGUILayout.TextArea(line.text, GUILayout.MinHeight(50));

//             line.audioClip = (AudioClip)EditorGUILayout.ObjectField("Audio Clip", line.audioClip, typeof(AudioClip), false);

//             if (line.audioClip != null)
//             {
//                 EditorGUILayout.BeginHorizontal();
//                 if (GUILayout.Button("▶ Play"))
//                 {
//                     PlayClip(line.audioClip);
//                 }
//                 if (GUILayout.Button("■ Stop"))
//                 {
//                     StopAllClips();
//                 }
//                 EditorGUILayout.EndHorizontal();
//             }

//             line.animationName = (DialogueLine.AnimationName)EditorGUILayout.EnumPopup("Animation", line.animationName);
//             line.shapekeyName = (DialogueLine.ShapekeyName)EditorGUILayout.EnumPopup("Shapekey", line.shapekeyName);

//             EditorGUILayout.EndVertical();
//             GUI.color = Color.white;
//         }

//         EditorGUILayout.Space();

//         if (GUILayout.Button("➕ Add New Line"))
//         {
//             data.dialogueLines.Add(new DialogueLine());
//         }

//         EditorGUILayout.Space();

//         if (GUILayout.Button("📥 Load Dialogue From CSV"))
//         {
//             string path = EditorUtility.OpenFilePanel("Select Dialogue CSV", "", "csv");
//             if (!string.IsNullOrEmpty(path))
//             {
//                 string csvText = File.ReadAllText(path);
//                 List<DialogueLine> lines = ParseCSV(csvText);
//                 data.dialogueLines = lines;
//                 EditorUtility.SetDirty(data);
//                 AssetDatabase.SaveAssets();
//                 Debug.Log("Dialogue loaded and asset saved.");
//             }
//         }

//         if (GUI.changed)
//         {
//             EditorUtility.SetDirty(data);
//         }
//     }

//     private List<DialogueLine> ParseCSV(string csvText)
//     {
//         List<DialogueLine> lines = new List<DialogueLine>();

//         string pattern = @"^\s*\""?(?<speaker>[^,""]+)\""?\s*,\s*\""?(?<text>[^""]*)\""?\s*$";
//         Regex regex = new Regex(pattern);

//         string[] records = csvText.Split(new char[] { '\n' }, System.StringSplitOptions.RemoveEmptyEntries);

//         int startIndex = 0;
//         if (records.Length > 0)
//         {
//             string firstLine = records[0].Trim().ToLower();
//             if (firstLine.Contains("speaker") && firstLine.Contains("text"))
//             {
//                 startIndex = 1;
//             }
//         }

//         for (int i = startIndex; i < records.Length; i++)
//         {
//             string record = records[i].Trim();
//             if (string.IsNullOrEmpty(record))
//                 continue;

//             Match match = regex.Match(record);
//             if (match.Success)
//             {
//                 DialogueLine line = new DialogueLine
//                 {
//                     speaker = (DialogueLine.Speaker)System.Enum.Parse(
//                         typeof(DialogueLine.Speaker),
//                         match.Groups["speaker"].Value.Trim(),
//                         true),
//                     text = match.Groups["text"].Value.Trim()
//                 };
//                 lines.Add(line);
//             }
//             else
//             {
//                 Debug.LogWarning("Skipping malformed CSV line: " + record);
//             }
//         }

//         return lines;
//     }

//     private Color GetColorForSpeaker(DialogueLine.Speaker speaker)
//     {
//         switch (speaker)
//         {
//             case DialogueLine.Speaker.DRAGON:
//                 return new Color(1f, 0.6f, 0.6f); // Light red
//             case DialogueLine.Speaker.PIRANHA:
//                 return new Color(0.5f, 0.8f, 1f); // Light blue
//             case DialogueLine.Speaker.IGUANA:
//                 return new Color(0.6f, 1f, 0.6f); // Light green
//             case DialogueLine.Speaker.GORILLA:
//                 return new Color(0.7f, 0.7f, 0.7f); // Light gray
//             case DialogueLine.Speaker.MONKEY:
//                 return new Color(1f, 1f, 0.6f); // Yellow
//             case DialogueLine.Speaker.PANTHER:
//                 return new Color(0.8f, 0.5f, 1f); // Purple
//             default:
//                 return Color.white;
//         }
//     }

//     private void PlayClip(AudioClip clip)
//     {
//         if (clip != null)
//         {
//             Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
//             System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
//             System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
//                 "PlayClip",
//                 System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public,
//                 null,
//                 new System.Type[] { typeof(AudioClip) },
//                 null
//             );
//             method.Invoke(null, new object[] { clip });
//         }
//     }

//     private void StopAllClips()
//     {
//         Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
//         System.Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
//         System.Reflection.MethodInfo method = audioUtilClass.GetMethod(
//             "StopAllClips",
//             System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.Public
//         );
//         method.Invoke(null, null);
//     }
// }
// #endif
