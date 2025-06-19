using UnityEngine;

public class RecordPlayer : ReticleInteractableBase
{
    public bool recordPlayerActive = false;

    private GameObject disc;
    private GameObject arm;

    private int mode;
    private float armAngle;
    private float discAngle;
    private float discSpeed;

    void Awake()
    {
        disc = transform.Find("teller")?.gameObject;
        arm = transform.Find("arm")?.gameObject;
    }

    void Start()
    {
        mode = 0;
        armAngle = 0f;
        discAngle = 0f;
        discSpeed = 0f;
    }

    void Update()
    {
        // Mode-based animation
        switch (mode)
        {
            case 0: // Off
                if (recordPlayerActive)
                    mode = 1;
                break;

            case 1: // Activation
                if (recordPlayerActive)
                {
                    armAngle += Time.deltaTime * 30f;
                    if (armAngle >= 30f)
                    {
                        armAngle = 30f;
                        mode = 2;
                    }
                    discAngle += Time.deltaTime * discSpeed;
                    discSpeed += Time.deltaTime * 80f;
                }
                else
                    mode = 3;
                break;

            case 2: // Playing
                if (recordPlayerActive)
                    discAngle += Time.deltaTime * discSpeed;
                else
                    mode = 3;
                break;

            case 3: // Stopping
                if (!recordPlayerActive)
                {
                    armAngle -= Time.deltaTime * 30f;
                    if (armAngle <= 0f)
                        armAngle = 0f;

                    discAngle += Time.deltaTime * discSpeed;
                    discSpeed -= Time.deltaTime * 80f;
                    if (discSpeed <= 0f)
                        discSpeed = 0f;

                    if (discSpeed == 0f && armAngle == 0f)
                        mode = 0;
                }
                else
                    mode = 1;
                break;
        }

        // Apply rotation transforms
        if (arm)
            arm.transform.localEulerAngles = new Vector3(0f, armAngle, 0f);
        if (disc)
            disc.transform.localEulerAngles = new Vector3(0f, discAngle, 0f);
    }

    // 🔁 This runs when gaze-clicked
    public override void OnPointerClick()
    {
        recordPlayerActive = !recordPlayerActive;
        Debug.Log($"[RecordPlayer] Player toggled: {recordPlayerActive}");
    }
}


// using UnityEngine;
// using System.Collections;

// public class RecordPlayer : MonoBehaviour {
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------

//     public bool recordPlayerActive = false;

//     GameObject disc;
//     GameObject arm;

//     int mode;
//     float armAngle;
//     float discAngle;
//     float discSpeed;

// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// void Awake()
// {
//     disc = gameObject.transform.Find("teller").gameObject;
//     arm = gameObject.transform.Find("arm").gameObject;
// }
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// void Start()
// {
//     mode = 0;
//     armAngle = 0.0f;
//     discAngle = 0.0f;
//     discSpeed = 0.0f;
// }
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// void Update()
// {
//     //-- Mode 0: player off
//     if(mode == 0)
//     {
//         if(recordPlayerActive == true)
//             mode = 1;
//     }
//     //-- Mode 1: activation
//     else if(mode == 1)
//     {
//         if(recordPlayerActive == true)
//         {
//             armAngle += Time.deltaTime * 30.0f;
//             if(armAngle >= 30.0f)
//             {
//                 armAngle = 30.0f;
//                 mode = 2;
//             }
//             discAngle += Time.deltaTime * discSpeed;
//             discSpeed += Time.deltaTime * 80.0f;
//         }
//         else
//             mode = 3;
//     }
//     //-- Mode 2: running
//     else if(mode == 2)
//     {
//         if(recordPlayerActive == true)
//             discAngle += Time.deltaTime * discSpeed;
//         else
//             mode = 3;
//     }
//     //-- Mode 3: stopping
//     else
//     {
//         if(recordPlayerActive == false)
//         {
//             armAngle -= Time.deltaTime * 30.0f;
//             if(armAngle <= 0.0f)
//                 armAngle = 0.0f;

//             discAngle += Time.deltaTime * discSpeed;
//             discSpeed -= Time.deltaTime * 80.0f;
//             if(discSpeed <= 0.0f)
//                 discSpeed = 0.0f;

//             if((discSpeed == 0.0f) && (armAngle == 0.0f))
//                 mode = 0;
//         }
//         else
//             mode = 1;
//     }

//     //-- update objects
//     arm.transform.localEulerAngles = new Vector3(0.0f, armAngle, 0.0f);
//     disc.transform.localEulerAngles = new Vector3(0.0f, discAngle, 0.0f);
// }
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// //--------------------------------------------------------------------------------------------
// }
