//using UnityEngine;

//public class FrogJumpController : MonoBehaviour
//{
//    public float hopDistance = 2f;
//    public float hopHeight = 1f;
//    public float hopDuration = 0.5f;

//    public LayerMask groundLayer;

//    private bool isHopping = false;
//    private Animator animator;

//    void Start()
//    {
//        animator = GetComponent<Animator>(); // 🎯 grab Animator on start
//    }

//    void Update()
//    {
//        if (isHopping) return;

//        if (Google.XR.Cardboard.Api.IsTriggerPressed)
//        {
//            Vector3 direction = Camera.main.transform.forward;
//            direction.y = 0;
//            direction.Normalize();

//            Vector3 targetPos = transform.position + direction * hopDistance;

//            if (Physics.Raycast(targetPos + Vector3.up * 2f, Vector3.down, out RaycastHit hit, 5f, groundLayer))
//            {
//                targetPos.y = hit.point.y + 0.05f;

//                // ✅ Trigger jump animation
//                if (animator != null)
//                {
//                    animator.SetTrigger("DoJump");
//                }

//                StartCoroutine(HopTo(targetPos));
//            }
//        }
//    }

//    private System.Collections.IEnumerator HopTo(Vector3 destination)
//    {
//        isHopping = true;
//        Vector3 start = transform.position;
//        float elapsed = 0;

//        while (elapsed < hopDuration)
//        {
//            float t = elapsed / hopDuration;
//            float arc = Mathf.Sin(t * Mathf.PI) * hopHeight;
//            transform.position = Vector3.Lerp(start, destination, t) + Vector3.up * arc;
//            elapsed += Time.deltaTime;
//            yield return null;
//        }

//        transform.position = destination;
//        isHopping = false;
//    }
//}