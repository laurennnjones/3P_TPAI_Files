using System.Collections.Generic;
using UnityEngine;

public class MonkeySpawner : MonoBehaviour
{
    public GameObject monkeyPrefab;
    public List<Transform> spawnPoints;

    [Header("Spawn Timing")]
    public float startSpawnDelay = 3f;
    public float minSpawnDelay = 1f;
    public float spawnSpeedUpRate = 0.1f;

    [Header("Monkey Lifetime")]
    public float monkeyLifetime = 5f;

    // Track which spawns are currently active
    private Dictionary<Transform, GameObject> activeMonkeys =
        new Dictionary<Transform, GameObject>();
    private float currentSpawnDelay;
    private float nextSpawnTime;

    void Start()
    {
        currentSpawnDelay = startSpawnDelay;
        nextSpawnTime = Time.time + currentSpawnDelay;
        InvokeRepeating(nameof(SpeedUpSpawns), 10f, 10f);
    }

    void Update()
    {
        if (Time.time >= nextSpawnTime)
        {
            TrySpawnMonkey();
            nextSpawnTime = Time.time + currentSpawnDelay;
        }
    }

    void TrySpawnMonkey()
    {
        List<Transform> availableSpawns = new List<Transform>();

        foreach (Transform point in spawnPoints)
        {
            if (!activeMonkeys.ContainsKey(point) || activeMonkeys[point] == null)
                availableSpawns.Add(point);
        }

        if (availableSpawns.Count == 0)
            return;

        Transform chosenPoint = availableSpawns[Random.Range(0, availableSpawns.Count)];
        GameObject monkey = Instantiate(monkeyPrefab, chosenPoint.position, chosenPoint.rotation);
        activeMonkeys[chosenPoint] = monkey;

        Destroy(monkey, monkeyLifetime);
        StartCoroutine(ClearAfter(monkeyLifetime, chosenPoint));
    }

    System.Collections.IEnumerator ClearAfter(float delay, Transform point)
    {
        yield return new WaitForSeconds(delay);
        activeMonkeys[point] = null;
    }

    void SpeedUpSpawns()
    {
        currentSpawnDelay = Mathf.Max(minSpawnDelay, currentSpawnDelay - spawnSpeedUpRate);
    }
}
