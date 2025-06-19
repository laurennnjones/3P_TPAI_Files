using UnityEngine;

public class FishBubbleHybrid : MonoBehaviour
{
    [Header("References")]
    public ParticleSystem breathBubbles;
    public ParticleSystem swimTrailBubbles;
    public Transform fishBody;

    [Header("Breath Timing")]
    public float minBreathInterval = 2f;
    public float maxBreathInterval = 5f;

    [Header("Swim Detection")]
    public float swimThreshold = 0.01f;

    private float nextBreathTime = 0f;
    private Vector3 lastPosition;
    private bool wasSwimming = false;

    void Start()
    {
        lastPosition = fishBody.position;
        ScheduleNextBreath();

        // Ensure emission modules are off initially
        var emission = swimTrailBubbles.emission;
        emission.enabled = false;
    }

    void Update()
    {
        // 🫁 BREATH BUBBLES (Way One)
        if (Time.time >= nextBreathTime)
        {
            breathBubbles.Play();
            ScheduleNextBreath();
        }

        // 🏊 SWIM TRAIL BUBBLES (Way Two)
        float movement = Vector3.Distance(fishBody.position, lastPosition);
        bool isSwimming = movement > swimThreshold;

        if (isSwimming != wasSwimming)
        {
            var emission = swimTrailBubbles.emission;
            emission.enabled = isSwimming;
            wasSwimming = isSwimming;
        }

        lastPosition = fishBody.position;
    }

    void ScheduleNextBreath()
    {
        nextBreathTime = Time.time + Random.Range(minBreathInterval, maxBreathInterval);
    }
}

// using UnityEngine;

// public class FishBubbleEmitter : MonoBehaviour
// {
//     public ParticleSystem bubbleParticles;
//     public float minInterval = 2f;
//     public float maxInterval = 5f;
//     public float oceanSurfaceY = 0f;

//     private float nextBubbleTime = 0f;

//     void Start()
//     {
//         ScheduleNextBubble();
//     }

//     void Update()
//     {
//         bool isUnderwater = transform.position.y < oceanSurfaceY;

//         if (isUnderwater && Time.time >= nextBubbleTime)
//         {
//             bubbleParticles.Play();
//             ScheduleNextBubble();
//         }
//     }

//     void ScheduleNextBubble()
//     {
//         nextBubbleTime = Time.time + Random.Range(minInterval, maxInterval);
//     }
// }
