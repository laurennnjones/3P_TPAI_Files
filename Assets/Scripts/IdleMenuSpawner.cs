using UnityEngine;

public class InactivityMenuController : MonoBehaviour
{
    public GameObject menuCanvas; // Assign your canvas (with buttons)
    public float inactivityThreshold = 5f;

    private float inactivityTimer = 0f;
    private bool menuVisible = false;
    private Camera mainCam;

    void Start()
    {
        mainCam = Camera.main;
        if (menuCanvas != null)
            menuCanvas.SetActive(false);
    }

    void Update()
    {
        if (InstructionUIManager.InstructionsAreVisible)
            return; // Don't track inactivity until instructions are gone

        // Check if user triggered (Cardboard trigger is mapped to Input.GetMouseButtonDown(0) by default)
        if (Input.GetMouseButtonDown(0))
        {
            inactivityTimer = 0f;

            if (menuVisible)
            {
                HideMenu();
            }
        }
        else
        {
            inactivityTimer += Time.deltaTime;

            if (inactivityTimer >= inactivityThreshold && !menuVisible)
            {
                ShowMenu();
            }
        }
    }

    void ShowMenu()
    {
        if (menuCanvas != null)
        {
            menuCanvas.SetActive(true);
            PositionMenuInFrontOfUser();
            menuVisible = true;
        }
    }

    void HideMenu()
    {
        if (menuCanvas != null)
        {
            menuCanvas.SetActive(false);
            menuVisible = false;
        }
    }

    void PositionMenuInFrontOfUser()
    {
        Transform camTransform = mainCam.transform;
        Vector3 forwardOffset = camTransform.forward * 2f; // 2 units in front
        Vector3 menuPosition = camTransform.position + forwardOffset;

        menuCanvas.transform.position = menuPosition;
        menuCanvas.transform.LookAt(camTransform); // Face camera
        menuCanvas.transform.Rotate(0, 180, 0); // Flip to face forward properly
    }
}


// using Cinemachine;
// using UnityEngine;

// public class IdleMenuSpawner : MonoBehaviour
// {
//     [Header("Menu Settings")]
//     public GameObject idleMenuGroup; // Drag your IdleMenuGroup here
//     public float distanceFromPlayer = 2f;

//     [Header("Idle Settings")]
//     public float idleTimeThreshold = 5f;

//     private float idleTimer = 0f;
//     private bool menuSpawned = false;

//     private Transform lookDirection;
//     private CinemachineVirtualCamera vCam;

//     void Start()
//     {
//         vCam = FindObjectOfType<CinemachineVirtualCamera>();
//         if (vCam != null)
//         {
//             lookDirection = vCam.transform;
//         }
//         else
//         {
//             lookDirection = Camera.main.transform;
//         }

//         if (idleMenuGroup != null)
//             idleMenuGroup.SetActive(false);
//     }

//     void Update()
//     {
//         if (Input.GetButtonDown("Fire1"))
//         {
//             idleTimer = 0f;
//             if (menuSpawned)
//             {
//                 idleMenuGroup.SetActive(false);
//                 menuSpawned = false;
//             }
//         }
//         else
//         {
//             idleTimer += Time.deltaTime;
//         }

//         if (idleTimer >= idleTimeThreshold && !menuSpawned)
//         {
//             SpawnMenuInFrontOfPlayer();
//             menuSpawned = true;
//         }
//     }

//     void SpawnMenuInFrontOfPlayer()
//     {
//         if (idleMenuGroup != null && lookDirection != null)
//         {
//             Vector3 spawnPosition =
//                 lookDirection.position + lookDirection.forward * distanceFromPlayer;
//             idleMenuGroup.transform.position = spawnPosition;
//             idleMenuGroup.transform.rotation = Quaternion.LookRotation(
//                 idleMenuGroup.transform.position - lookDirection.position
//             );
//             idleMenuGroup.SetActive(true);
//         }
//     }
// }
