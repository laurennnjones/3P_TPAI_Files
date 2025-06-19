using System.Collections;
using UnityEngine;
using UnityEngine.AI; // For pathfinding

public class CreatureWanderBehavior : MonoBehaviour
{
    [Header("Wandering Settings")]
    public float walkSpeed = 2f;
    public float turnSpeed = 100f;
    public float wanderRadius = 10f;
    public float minPauseTime = 2f;
    public float maxPauseTime = 5f;

    [Header("Terrain Settings")]
    public Terrain terrain;

    [Header("Flee Settings")]
    public float fleeDistance = 5f;
    public Transform predator;

    private NavMeshAgent agent;
    private Animator animator;

    private void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();

        // Ensure NavMeshAgent is set up properly
        agent.speed = walkSpeed;
        agent.angularSpeed = turnSpeed;
        agent.autoBraking = true;

        StartCoroutine(WanderRoutine());
    }

    private IEnumerator WanderRoutine()
    {
        while (true)
        {
            // Check if a predator is nearby
            if (
                predator != null
                && Vector3.Distance(transform.position, predator.position) < fleeDistance
            )
            {
                Flee();
                yield return new WaitForSeconds(Random.Range(2f, 4f)); // Wait before resuming normal behavior
                continue;
            }

            // Pick a random point within the wander radius
            Vector3 randomPoint = GetRandomPointOnTerrain();

            // Move the creature to the random point
            agent.SetDestination(randomPoint);
            //animator.SetBool("isMoving", true);

            // Wait until the creature reaches the destination
            while (!agent.pathPending && agent.remainingDistance > agent.stoppingDistance)
            {
                yield return null;
            }

            // Stop moving and pause for a random duration
            //animator.SetBool("isMoving", false);
            yield return new WaitForSeconds(Random.Range(minPauseTime, maxPauseTime));
        }
    }

    private Vector3 GetRandomPointOnTerrain()
    {
        Vector3 randomPoint =
            transform.position
            + new Vector3(
                Random.Range(-wanderRadius, wanderRadius),
                0f,
                Random.Range(-wanderRadius, wanderRadius)
            );

        // Get terrain height at that point
        if (terrain != null)
        {
            float terrainHeight = terrain.SampleHeight(randomPoint);
            randomPoint.y = terrainHeight;
        }

        return randomPoint;
    }

    private void Flee()
    {
        Vector3 directionAway = (transform.position - predator.position).normalized;
        Vector3 fleePoint = transform.position + directionAway * fleeDistance;

        if (terrain != null)
        {
            fleePoint.y = terrain.SampleHeight(fleePoint);
        }

        agent.SetDestination(fleePoint);
        //animator.SetBool("isMoving", true);
    }
}
