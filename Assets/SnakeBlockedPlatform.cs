using UnityEngine;

public class SnakeBlockedPlatform : JumpTarget
{
    public GameObject snake;
    public float blockDuration = 3f;
    private bool isBlocking = true;

    private void Start()
    {
        base.Start();
        if (snake != null)
            snake.SetActive(true);
        Invoke(nameof(Unblock), blockDuration);
    }

    public override void OnPointerClick()
    {
        if (isBlocking)
        {
            Debug.Log("Blocked by snake!");
            return;
        }

        base.OnPointerClick();
    }

    private void Unblock()
    {
        isBlocking = false;
        if (snake != null)
            snake.SetActive(false);
    }
}
