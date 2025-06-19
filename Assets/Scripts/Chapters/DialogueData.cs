using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewDialogueData", menuName = "Dialogue/DialogueData")]
public class DialogueData : ScriptableObject
{
    public List<DialogueLine> dialogueLines;

    [Tooltip(
        "Characters who are present in this scene (used to filter non-speaking character actions)."
    )]
    public List<DialogueLine.Speaker> sceneCharacters = new List<DialogueLine.Speaker>();
}
