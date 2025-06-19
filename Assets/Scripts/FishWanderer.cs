using System.Collections;
using UnityEngine;

[RequireComponent(typeof(Animator))]
[RequireComponent(typeof(Collider))] // we need a trigger
public class PiranhahWanderer : MonoBehaviour
{
    [Header("Swimming Settings")]
    [Tooltip("Speed at which the fish moves forward.")]
    public float swimSpeed = 2f;

    [Tooltip("How quickly the fish can turn when changing direction.")]
    public float turnSpeed = 50f;

    [Tooltip("How often (seconds) the fish picks a new direction.")]
    public float directionChangeInterval = 3f;

    // [Header("Wander Bounds (Horizontal)")]
    // [Tooltip("Center of the lake (fish will try to stay inside this area).")]
    // public Vector3 lakeCenter = new Vector3(60f, 45f, 225f);

    // [Tooltip("Maximum radius the fish can wander from the lake center.")]
    // public float lakeRadius = 20f;

    [Header("Blinking & Expressions")]
    public bool enableBlinking = true;
    public SkinnedMeshRenderer skinnedMeshRenderer;
    public string blinkShapeKey = "eyes.blink";

    [Header("Animator Triggers")]
    public string triggerAnnoyed = "TriggerAnnoyed";
    public string triggerHappy = "TriggerHappy";

    [Header("Tag Settings")]
    [Tooltip("Tag on your Player‐Fish GameObject")]
    public string playerTag = "PlayerFish";

    [Tooltip("Optional VFX when tagged")]
    public GameObject tagEffectPrefab;

    // internal
    float _targetYaw;
    Animator _animator;
    int _blinkIndex;
    bool _isTagged;

    // ocean‐bounds (vertical)
    float _oceanMinY;
    float _oceanMaxY;

    private void Start()
    {
        _animator = GetComponent<Animator>();
        _targetYaw = transform.eulerAngles.y;

        // pick wander directions
        StartCoroutine(ChangeDirectionRoutine());

        // blinking
        if (enableBlinking && skinnedMeshRenderer != null)
        {
            _blinkIndex = skinnedMeshRenderer.sharedMesh.GetBlendShapeIndex(blinkShapeKey);
            if (_blinkIndex >= 0)
                StartCoroutine(BlinkCoroutine());
        }

        // make sure our collider is a trigger
        var col = GetComponent<Collider>();
        col.isTrigger = true;

        // grab your ocean collider by name (or tag) and cache its Y bounds
        var oceanGO = GameObject.Find("Ocean_Collider");
        if (oceanGO != null)
        {
            var oceanCol = oceanGO.GetComponent<Collider>();
            _oceanMinY = oceanCol.bounds.min.y;
            _oceanMaxY = oceanCol.bounds.max.y;
        }
        else
        {
            Debug.LogWarning("Ocean_Collider not found – vertical bounds disabled.");
            _oceanMinY = float.NegativeInfinity;
            _oceanMaxY = float.PositiveInfinity;
        }

        // Trigger annoyed face at start
        if (_animator != null && !string.IsNullOrEmpty(triggerAnnoyed))
        {
            _animator.SetTrigger(triggerAnnoyed);
        }
    }

    private void Update()
    {
        if (_isTagged)
            return;

        // 1) rotate toward target yaw
        float currentYaw = transform.eulerAngles.y;
        float newYaw = Mathf.MoveTowardsAngle(currentYaw, _targetYaw, turnSpeed * Time.deltaTime);
        transform.eulerAngles = new Vector3(0, newYaw, 0);

        // 2) swim forward
        transform.Translate(Vector3.forward * swimSpeed * Time.deltaTime);

        // 3) horizontal bounds: keep inside circle
        // Vector3 offset = transform.position - lakeCenter;
        // if (offset.sqrMagnitude > lakeRadius * lakeRadius)
        // {
        //     Vector3 toCenter = (lakeCenter - transform.position).normalized;
        //     _targetYaw = Quaternion.LookRotation(toCenter, Vector3.up).eulerAngles.y;
        // }

        // 4) **vertical bounds**: clamp Y between ocean floor and surface
        // Vector3 pos = transform.position;
        // pos.y = Mathf.Clamp(pos.y, _oceanMinY, _oceanMaxY);
        // transform.position = pos;
    }

    private IEnumerator ChangeDirectionRoutine()
    {
        while (!_isTagged)
        {
            _targetYaw = Random.Range(0f, 360f);
            yield return new WaitForSeconds(directionChangeInterval);
        }
    }

    private IEnumerator BlinkCoroutine()
    {
        yield return new WaitForSeconds(Random.Range(0f, 3f));
        while (!_isTagged)
        {
            yield return new WaitForSeconds(Random.Range(3f, 7f));
            if (_blinkIndex >= 0)
                skinnedMeshRenderer.SetBlendShapeWeight(_blinkIndex, 100f);
            yield return new WaitForSeconds(Random.Range(0.08f, 0.15f));
            if (_blinkIndex >= 0)
                skinnedMeshRenderer.SetBlendShapeWeight(_blinkIndex, 0f);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!_isTagged && other.CompareTag(playerTag))
        {
            _isTagged = true;
            if (tagEffectPrefab != null)
                Instantiate(tagEffectPrefab, transform.position, Quaternion.identity);
            if (_animator != null && !string.IsNullOrEmpty(triggerHappy))
            {
                _animator.SetTrigger(triggerHappy);
            }

            // Optional: stop swimming/blinking behavior
            StopAllCoroutines();
            enabled = false;
        }
    }
}
