#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(ChapterManager))]
public class ChapterManagerEditor : Editor
{
    private readonly bool[] foldouts = new bool[6];
    private readonly string[] labels =
    {
        "Dragon",
        "Piranha",
        "Iguana",
        "Gorilla",
        "Monkey",
        "Panther",
    };
    private readonly string[] fieldBaseNames =
    {
        "dragon",
        "piranha",
        "iguana",
        "gorilla",
        "monkey",
        "panther",
    };
    private readonly string[] toggleFieldNames =
    {
        "useDragon",
        "usePiranha",
        "useIguana",
        "useGorilla",
        "useMonkey",
        "usePanther",
    };

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        DrawDefaultInspectorExceptCharacterFields();

        for (int i = 0; i < fieldBaseNames.Length; i++)
        {
            SerializedProperty toggle = serializedObject.FindProperty(toggleFieldNames[i]);
            EditorGUILayout.PropertyField(toggle, new GUIContent($"Enable {labels[i]}"));

            if (toggle.boolValue)
            {
                foldouts[i] = EditorGUILayout.Foldout(
                    foldouts[i],
                    $"    ▼ {labels[i]} Settings",
                    true
                );
                if (foldouts[i])
                {
                    EditorGUI.indentLevel++;
                    DrawCharacterField(fieldBaseNames[i]);
                    EditorGUI.indentLevel--;
                }
            }
        }

        serializedObject.ApplyModifiedProperties();
    }

    private void DrawDefaultInspectorExceptCharacterFields()
    {
        SerializedProperty prop = serializedObject.GetIterator();
        bool enterChildren = true;

        while (prop.NextVisible(enterChildren))
        {
            enterChildren = false;
            string propName = prop.name.ToLower();

            if (
                propName.Contains("dragon")
                || propName.Contains("piranha")
                || propName.Contains("iguana")
                || propName.Contains("gorilla")
                || propName.Contains("monkey")
                || propName.Contains("panther")
            )
                continue;

            EditorGUILayout.PropertyField(prop, true);
        }
    }

    private void DrawCharacterField(string character)
    {
        DrawProperty(character);
        DrawProperty($"{character}Bubble");
        DrawProperty($"{character}Text");
    }

    private void DrawProperty(string name)
    {
        var prop = serializedObject.FindProperty(name);
        if (prop != null)
        {
            EditorGUILayout.PropertyField(prop);
        }
    }
}
#endif
