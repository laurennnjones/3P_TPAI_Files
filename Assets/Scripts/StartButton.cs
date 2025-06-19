using UnityEngine;

public class StartButton : MonoBehaviour
{
    public InstructionUIManager instructionManager;

    public void OnClick()
    {
        instructionManager.SkipAndStart();
    }
}
