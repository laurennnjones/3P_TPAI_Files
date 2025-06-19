using Google.XR.Cardboard;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CrabDialogueTrigger : MonoBehaviour
{
    public GameObject dialogueCanvas; // Assign in inspector
    public TextMeshProUGUI dialogueText; // Assign in inspector
    public string[] dialogueLines; // Crab’s dialogue lines

    private int currentLine = 0;
    private bool dialogueActive = false;

    private CardboardFishController fishController;
    private Rigidbody fishRigidbody;

    private void OnTriggerEnter(Collider other)
    {
        if (dialogueActive)
            return;

        if (other.CompareTag("PlayerFish")) // Make sure piranha is tagged "Player"
        {
            fishController = other.GetComponent<CardboardFishController>();
            fishRigidbody = other.GetComponent<Rigidbody>();

            if (fishController != null && fishRigidbody != null)
            {
                // 1. Freeze movement, allow rotation
                fishController.enabled = false;
                fishRigidbody.velocity = Vector3.zero;
                fishRigidbody.isKinematic = false;
                fishRigidbody.constraints = RigidbodyConstraints.FreezePosition;

                // 2. Show dialogue
                dialogueCanvas.SetActive(true);
                dialogueText.text = dialogueLines[0];
                currentLine = 0;
                dialogueActive = true;
            }
        }
    }

    private void Update()
    {
        if (!dialogueActive)
            return;

        if (Api.IsTriggerPressed)
        {
            currentLine++;
            if (currentLine < dialogueLines.Length)
            {
                dialogueText.text = dialogueLines[currentLine];
            }
            else
            {
                EndDialogue();
            }
        }
    }

    private void EndDialogue()
    {
        dialogueActive = false;
        dialogueCanvas.SetActive(false);

        if (fishRigidbody != null)
        {
            fishRigidbody.constraints = RigidbodyConstraints.None;
            fishRigidbody.isKinematic = false;
        }

        if (fishController != null)
            fishController.enabled = true;

        // Optional: destroy this script if you want the dialogue to trigger only once
        Destroy(this);
    }
}
