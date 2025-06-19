//using UnityEngine;

//public class FrogHopArcWithCheck : MonoBehaviour
//{
//    public float baseHopDistance = 1f;
//    public float maxHopMultiplier = 3f;
//    public float momentumResetTime = 1.2f;
//    public float hopCooldown = 0.1f;
//    public float hopDuration = 0.3f;
//    public float hopHeight = 1f;
//    public LayerMask groundLayer;

//    private float currentMultiplier = 1f;
//    private float lastTapTime;
//    private float lastHopTime;
//    private bool isHopping = false;

//    void Update()
//    {
//        if (Input.GetMouseButtonDown(0) && !isHopping)
//        {
//            float timeSinceLastTap = Time.time - lastTapTime;

//            if (timeSinceLastTap < 0.4f)
//                currentMultiplier = Mathf.Min(currentMultiplier + 0.5f, maxHopMultiplier);
//            else
//                currentMultiplier = 1f;

//            if (Time.time - lastHopTime > hopCooldown)
//            {
//                Vector3 hopDir = Camera.main.transform.forward;
//                hopDir.y = 0;
//                hopDir.Normalize();

//                float hopDistance = baseHopDistance * currentMultiplier;
//                Vector3 targetPos = transform.position + hopDir * hopDistance;

//                // Raycast down from target to check if there's valid ground
//                Vector3 checkPos = targetPos + Vector3.up * 2f; // Start ray above target
//                RaycastHit hit;

//                if (Physics.Raycast(checkPos, Vector3.down, out hit, 5f, groundLayer))
//                {
//                    targetPos.y = hit.point.y;
//                    StartCoroutine(HopArc(targetPos));
//                    lastHopTime = Time.time;
//                }
//                else
//                {
//                    // No ground — fall/die/splash
//                    Debug.Log("No ground detected! Trigger fall.");
//                    StartCoroutine(FallIntoVoid(targetPos));
//                }
//            }

//            lastTapTime = Time.time;
//        }

//        if (Time.time - lastTapTime > momentumResetTime)
//        {
//            currentMultiplier = 1f;
//        }
//    }

//    System.Collections.IEnumerator HopArc(Vector3 targetPos)
//    {
//        isHopping = true;
//        Vector3 startPos = transform.position;
//        float elapsed = 0;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float height = Mathf.Sin(Mathf.PI * t) * hopHeight;
//            transform.position = Vector3.Lerp(startPos, targetPos, t) + Vector3.up * height;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        transform.position = targetPos;
//        isHopping = false;
//    }

//    System.Collections.IEnumerator FallIntoVoid(Vector3 toward)
//    {
//        isHopping = true;
//        Vector3 startPos = transform.position;
//        Vector3 target = toward;
//        target.y = startPos.y; // Stay level as we leap off

//        float elapsed = 0;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float height = Mathf.Sin(Mathf.PI * t) * hopHeight;
//            transform.position = Vector3.Lerp(startPos, target, t) + Vector3.up * height;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        // Optional: play splash or death effect
//        Debug.Log("Player fell — restart or lose life here.");

//        // Example: reset position
//        transform.position = new Vector3(0, 1, 0); // Replace with your start point
//        currentMultiplier = 1f;
//        isHopping = false;
//    }

//    void OnTriggerEnter(Collider other)
//    {
//        if (other.CompareTag("Log"))
//        {
//            transform.SetParent(other.transform); // Stick to log
//        }
//    }

//    void OnTriggerExit(Collider other)
//    {
//        if (other.CompareTag("Log"))
//        {
//            transform.SetParent(null); // Detach from log when hopping off
//        }
//    }
//}
