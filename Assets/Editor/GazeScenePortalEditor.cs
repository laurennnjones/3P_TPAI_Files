using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(GazeScenePortal))]
public class GazeScenePortalEditor : Editor
{
    private bool showTintSettings = true;

    public override void OnInspectorGUI()
    {
        GazeScenePortal portal = (GazeScenePortal)target;

        // Scene + fade
        portal.sceneIndex = EditorGUILayout.IntField("Scene Index", portal.sceneIndex);
        portal.fadeScreen = (UniversalFadeScreen)
            EditorGUILayout.ObjectField(
                "Fade Screen",
                portal.fadeScreen,
                typeof(UniversalFadeScreen),
                true
            );

        // Materials
        portal.inactiveMaterial = (Material)
            EditorGUILayout.ObjectField(
                "Inactive Material",
                portal.inactiveMaterial,
                typeof(Material),
                false
            );

        portal.gazedAtMaterial = (Material)
            EditorGUILayout.ObjectField(
                "Gazed At Material",
                portal.gazedAtMaterial,
                typeof(Material),
                false
            );

        EditorGUILayout.Space();

        // Tint settings (only show if no gazedAtMaterial assigned)
        if (portal.gazedAtMaterial == null)
        {
            showTintSettings = EditorGUILayout.Foldout(showTintSettings, "Gaze Highlight Settings");
            if (showTintSettings)
            {
                EditorGUI.indentLevel++;
                portal.enableTint = EditorGUILayout.Toggle("Enable Tinting", portal.enableTint);

                if (portal.enableTint)
                {
                    portal.gazeTintColor = EditorGUILayout.ColorField(
                        "Tint Color",
                        portal.gazeTintColor
                    );
                    portal.gazeTintIntensity = EditorGUILayout.Slider(
                        "Tint Intensity",
                        portal.gazeTintIntensity,
                        0f,
                        1f
                    );
                }
                EditorGUI.indentLevel--;
            }
        }
        else
        {
            EditorGUILayout.HelpBox(
                "Tint settings are disabled while Gazed At Material is assigned.",
                MessageType.Info
            );
        }

        // Mark object as dirty if anything changed
        if (GUI.changed)
        {
            EditorUtility.SetDirty(portal);
        }
    }
}


// using UnityEditor;
// using UnityEngine;

// [CustomEditor(typeof(GazeScenePortal))]
// public class GazeScenePortalEditor : Editor
// {
//     private bool showTintSettings = true;

//     public override void OnInspectorGUI()
//     {
//         GazeScenePortal portal = (GazeScenePortal)target;

//         portal.sceneIndex = EditorGUILayout.IntField("Scene Index", portal.sceneIndex);
//         portal.fadeScreen = (UniversalFadeScreen)
//             EditorGUILayout.ObjectField(
//                 "Fade Screen",
//                 portal.fadeScreen,
//                 typeof(UniversalFadeScreen),
//                 true
//             );
//         portal.inactiveMaterial = (Material)
//             EditorGUILayout.ObjectField(
//                 "Inactive Material",
//                 portal.inactiveMaterial,
//                 typeof(Material),
//                 false
//             );

//         EditorGUILayout.Space();
//         EditorGUILayout.LabelField("Distance Settings", EditorStyles.boldLabel);
//         portal.useDistanceCheck = EditorGUILayout.Toggle(
//             "Use Distance Check",
//             portal.useDistanceCheck
//         );

//         if (portal.useDistanceCheck)
//         {
//             portal.playerTransform = (Transform)
//                 EditorGUILayout.ObjectField(
//                     "Player Transform",
//                     portal.playerTransform,
//                     typeof(Transform),
//                     true
//                 );
//             portal.interactionDistance = EditorGUILayout.FloatField(
//                 "Interaction Distance",
//                 portal.interactionDistance
//             );
//         }

//         EditorGUILayout.Space();
//         showTintSettings = EditorGUILayout.Foldout(showTintSettings, "Gaze Highlight Settings");
//         if (showTintSettings)
//         {
//             EditorGUI.indentLevel++;
//             portal.enableTint = EditorGUILayout.Toggle("Enable Tinting", portal.enableTint);

//             if (portal.enableTint)
//             {
//                 portal.gazeTintColor = EditorGUILayout.ColorField(
//                     "Tint Color",
//                     portal.gazeTintColor
//                 );
//                 portal.gazeTintIntensity = EditorGUILayout.Slider(
//                     "Tint Intensity",
//                     portal.gazeTintIntensity,
//                     0f,
//                     1f
//                 );
//             }
//             EditorGUI.indentLevel--;
//         }

//         if (GUI.changed)
//         {
//             EditorUtility.SetDirty(portal);
//         }
//     }
// }



// using UnityEditor;
// using UnityEngine;

// [CustomEditor(typeof(GazeScenePortal))]
// public class GazeScenePortalEditor : Editor
// {
//     public override void OnInspectorGUI()
//     {
//         GazeScenePortal portal = (GazeScenePortal)target;

//         // Draw default fields except those we'll handle manually
//         portal.sceneIndex = EditorGUILayout.IntField("Scene Index", portal.sceneIndex);
//         portal.fadeScreen = (UniversalFadeScreen)
//             EditorGUILayout.ObjectField(
//                 "Fade Screen",
//                 portal.fadeScreen,
//                 typeof(UniversalFadeScreen),
//                 true
//             );
//         portal.inactiveMaterial = (Material)
//             EditorGUILayout.ObjectField(
//                 "Inactive Material",
//                 portal.inactiveMaterial,
//                 typeof(Material),
//                 false
//             );
//         portal.gazedAtMaterial = (Material)
//             EditorGUILayout.ObjectField(
//                 "Gazed At Material",
//                 portal.gazedAtMaterial,
//                 typeof(Material),
//                 false
//             );

//         EditorGUILayout.Space();
//         EditorGUILayout.LabelField("Distance Settings", EditorStyles.boldLabel);

//         portal.useDistanceCheck = EditorGUILayout.Toggle(
//             "Use Distance Check",
//             portal.useDistanceCheck
//         );

//         if (portal.useDistanceCheck)
//         {
//             portal.playerTransform = (Transform)
//                 EditorGUILayout.ObjectField(
//                     "Player Transform",
//                     portal.playerTransform,
//                     typeof(Transform),
//                     true
//                 );
//             portal.interactionDistance = EditorGUILayout.FloatField(
//                 "Interaction Distance",
//                 portal.interactionDistance
//             );
//         }

//         // Mark the script dirty so changes get saved
//         if (GUI.changed)
//         {
//             EditorUtility.SetDirty(portal);
//         }
//     }
// }
