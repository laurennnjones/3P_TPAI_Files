using UnityEngine;

public class LaneObstacleMover : MonoBehaviour
{
    public float speed = 2f;
    public float resetPositionX = -10f;
    public float startPositionX = 10f;

    void Update()
    {
        transform.Translate(Vector3.left * speed * Time.deltaTime);

        if (transform.position.x < resetPositionX)
        {
            Vector3 pos = transform.position;
            pos.x = startPositionX;
            transform.position = pos;
        }
    }
}

