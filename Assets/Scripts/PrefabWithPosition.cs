using UnityEngine;

[System.Serializable]
public class PrefabWithPosition
{
    public GameObject prefab;
    public Vector3 position;
    public Vector3 scale = Vector3.one; // Default scale of 1
}
