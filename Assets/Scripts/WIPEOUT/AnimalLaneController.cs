using UnityEngine;

public class PlatformLaneController : MonoBehaviour
{
    public GameObject[] platformPrefabs; // Drag all your platform variants here in Inspector
    public int platformCount = 4;
    public float spacing = 5f;
    public float speed = 2f;
    public bool moveRight = true;
    public float laneLength = 60f;

    private GameObject[] platforms; // ✅ Declare the array

    void Start()
    {
        platforms = new GameObject[platformCount];

        Vector3 moveDir = moveRight ? transform.right : -transform.right;
        float halfLength = laneLength / 2f;

        for (int i = 0; i < platformCount; i++)
        {
            float offset = i * spacing;
            Vector3 spawnPos = transform.position - moveDir * (halfLength - offset);

            // ✅ Only randomize once
            GameObject prefabToUse = platformPrefabs[Random.Range(0, platformPrefabs.Length)];

            GameObject platform = Instantiate(prefabToUse, spawnPos, Quaternion.identity, transform);
            platform.transform.rotation = Quaternion.LookRotation(moveDir); // Optional: face direction

            platforms[i] = platform;
        }
    }

    void Update()
    {
        Vector3 moveDir = moveRight ? transform.right : -transform.right;
        float halfLength = laneLength / 2f;

        foreach (GameObject platform in platforms)
        {
            platform.transform.Translate(moveDir * speed * Time.deltaTime, Space.World);

            Vector3 localOffset = platform.transform.position - transform.position;
            float lanePos = Vector3.Dot(localOffset, moveDir);

            if (lanePos > halfLength)
                platform.transform.position -= moveDir * laneLength;
            else if (lanePos < -halfLength)
                platform.transform.position += moveDir * laneLength;
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.cyan;
        Vector3 moveDir = moveRight ? transform.right : -transform.right;
        Vector3 start = transform.position - moveDir * laneLength / 2f;
        Vector3 end = transform.position + moveDir * laneLength / 2f;
        Gizmos.DrawLine(start, end);
        Gizmos.DrawSphere(start, 0.2f);
        Gizmos.DrawSphere(end, 0.2f);
    }

    public void IncreaseDifficulty(float speedMultiplier, float spacingMultiplier)
    {
        speed *= speedMultiplier;
        spacing *= spacingMultiplier;
    }
}



// using UnityEngine;

// public class platformLaneController : MonoBehaviour
// {
//     public GameObject[] platformPrefabs; // Includes: Glass, SnakeBlocked, Falling, etc.

//     public int platformCount = 4; // Only need a few that recycle
//     public float spacing = 5f;
//     public float speed = 2f;
//     public bool moveRight = true;
//     public float laneLength = 60f; // Total length before loop

//     private GameObject[] platforms;

//     void Start()
//     {
//         platforms = new GameObject[platformCount];

//         Vector3 moveDir = moveRight ? transform.right : -transform.right;
//         float halfLength = laneLength / 2f;

//         for (int i = 0; i < platformCount; i++)
//         {
//             // Start evenly spaced along the lane
//             float offset = i * spacing;
//             Vector3 spawnPos = transform.position - moveDir * (halfLength - offset);

//             GameObject platform = Instantiate(platformPrefab, spawnPos, Quaternion.identity, transform);
//             platform.transform.rotation = Quaternion.LookRotation(moveDir);

//             platforms[i] = platform;
//         }
//     }

//     void Update()
//     {
//         Vector3 moveDir = moveRight ? transform.right : -transform.right;
//         float halfLength = laneLength / 2f;

//         foreach (GameObject platform in platforms)
//         {
//             platform.transform.Translate(moveDir * speed * Time.deltaTime, Space.World);

//             // Calculate position along lane
//             Vector3 localOffset = platform.transform.position - transform.position;
//             float lanePos = Vector3.Dot(localOffset, moveDir);

//             // If out of bounds, wrap around to the other side
//             if (lanePos > halfLength)
//             {
//                 platform.transform.position -= moveDir * laneLength;
//             }
//             else if (lanePos < -halfLength)
//             {
//                 platform.transform.position += moveDir * laneLength;
//             }
//         }
//     }

//     void OnDrawGizmos()
//     {
//         Gizmos.color = Color.cyan;
//         Vector3 moveDir = moveRight ? transform.right : -transform.right;
//         Vector3 start = transform.position - moveDir * laneLength / 2f;
//         Vector3 end = transform.position + moveDir * laneLength / 2f;
//         Gizmos.DrawLine(start, end);
//         Gizmos.DrawSphere(start, 0.2f);
//         Gizmos.DrawSphere(end, 0.2f);
//     }

//     public void IncreaseDifficulty(float speedMultiplier, float spacingMultiplier)
//     {
//         speed *= speedMultiplier;
//         spacing *= spacingMultiplier;
//     }
// }


//using UnityEngine;

//public class platformLaneController : MonoBehaviour
//{
//    public GameObject platformPrefab;
//    public int platformCount = 3;
//    public float spacing = 5f;
//    public float speed = 2f;
//    public bool moveRight = true;
//    public float laneWidth = 20f;

//    private GameObject[] platforms;

//    void Start()
//    {
//        platforms = new GameObject[platformCount];

//        for (int i = 0; i < platformCount; i++)
//        {
//            Vector3 startPos = transform.position;
//            startPos.x += (moveRight ? -1 : 1) * i * spacing;

//            GameObject platform = Instantiate(platformPrefab, startPos, Quaternion.identity, transform);
//            if (moveRight)
//                platform.transform.rotation = Quaternion.Euler(0, 90, 0);
//            else
//                platform.transform.rotation = Quaternion.Euler(0, -90, 0);

//            platforms[i] = platform;
//        }
//    }

//    void Update()
//    {
//        foreach (GameObject platform in platforms)
//        {
//            Vector3 moveDir = moveRight ? Vector3.right : Vector3.left;
//            platform.transform.Translate(moveDir * speed * Time.deltaTime, Space.World);

//            if (Mathf.Abs(platform.transform.position.x - transform.position.x) > laneWidth)
//            {
//                Vector3 resetPos = platform.transform.position;
//                resetPos.x = transform.position.x + (moveRight ? -laneWidth : laneWidth);
//                platform.transform.position = resetPos;
//            }
//        }
//    }

//    public void IncreaseDifficulty(float speedMultiplier, float spacingMultiplier)
//    {
//        speed *= speedMultiplier;
//        spacing *= spacingMultiplier;
//    }

//    void OnDrawGizmos()
//    {
//        // Only draw when this object is selected in the editor
//        Gizmos.color = Color.cyan;

//        // Start and end points of the lane (x-axis based on laneWidth)
//        Vector3 start = transform.position + Vector3.left * laneWidth;
//        Vector3 end = transform.position + Vector3.right * laneWidth;

//        // Draw a line across the lane
//        Gizmos.DrawLine(start, end);

//        // Optional: draw arrows to show direction
//        Vector3 dir = moveRight ? Vector3.right : Vector3.left;
//        Vector3 arrowHead = transform.position + dir * 1.5f;
//        Gizmos.DrawLine(transform.position, arrowHead);
//    }

//}
