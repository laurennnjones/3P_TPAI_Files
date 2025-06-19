using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class DialogueLine
{
    // -------------------------------------
    // 1. CORE DIALOGUE DATA
    // -------------------------------------
    [Tooltip("The character speaking this line.")]
    public Speaker speaker; // Enum for speaker

    [Tooltip("The dialogue text.")]
    public string text; // Dialogue text

    [Tooltip("Audio clip for this dialogue line.")]
    public AudioClip audioClip; // Optional audio clip

    [Tooltip("Animation for the speaker during this dialogue line.")]
    public AnimationName animationName = AnimationName.None; // Enum for animation

    [Tooltip("Shapekey for the speaker during this dialogue line.")]
    public ShapekeyName shapekeyName = ShapekeyName.None; // Enum for shapekey

    [Tooltip("Prefab indices to spawn during this dialogue line.")]
    public List<int> prefabIndices = new List<int>(); // Prefab indices

    [Tooltip("Actions for non-speaking characters.")]
    public List<CharacterAction> nonSpeakingCharacterActions = new List<CharacterAction>(); // Non-speaking character actions

    // -------------------------------------
    // 2. ENUM DEFINITIONS
    // -------------------------------------
    public enum Speaker
    {
        PIRANHA,
        IGUANA,
        DRAGON,
        GORILLA,
        MONKEY,
        PANTHER,
    }

    public enum AnimationName
    {
        None,
        Attack,
        Bounce,
        Clicked,
        Death,
        Eat,
        Fear,
        Fly,
        Hit,
        Idle_A,
        Idle_B,
        Idle_C,
        Jump,
        Roll,
        Run,
        Sit,
        Spin_Splash,
        Swim,
        Walk,
    }

    public enum ShapekeyName
    {
        None = -1,
        Eyes_Blink = 0,
        Eyes_Happy = 1,
        Eyes_Sad = 2,
        Eyes_Sleep = 3,
        Eyes_Annoyed = 4,
        Eyes_Squint = 5,
        Eyes_Shrink = 6,
        Eyes_Dead = 7,
        Eyes_LookOut = 8,
        Eyes_LookIn = 9,
        Eyes_LookUp = 10,
        Eyes_LookDown = 11,
        Eyes_Excited_1 = 12,
        Eyes_Excited_2 = 13,
        Eyes_Rabid = 14,
        Eyes_Spin_1 = 15,
        Eyes_Spin_2 = 16,
        Eyes_Spin_3 = 17,
        Eyes_Cry_1 = 18,
        Eyes_Cry_2 = 19,
        Eyes_Trauma = 20,
        Teardrop_1_L = 21,
        Teardrop_2_L = 22,
        Sweat_1_L = 23,
        Sweat_2_L = 24,
        Teardrop_1_R = 25,
        Teardrop_2_R = 26,
        Sweat_1_R = 27,
        Sweat_2_R = 28,
    }

    [System.Serializable]
    public class CharacterAction
    {
        [Tooltip("Non-speaking character.")]
        public Speaker character;

        [Tooltip("Animation for the non-speaker.")]
        public AnimationName animation = AnimationName.None;

        [Tooltip("Shapekey for the non-speaker.")]
        public ShapekeyName shapekey = ShapekeyName.None;
    }

    // -------------------------------------
    // 3. MISSING METHODS
    // -------------------------------------

    // Add this method to fix the errors
    public AnimationName GetDefaultIdleAnimation(Speaker speaker)
    {
        return speaker switch
        {
            Speaker.DRAGON => AnimationName.Fly,
            Speaker.PIRANHA => AnimationName.Swim,
            Speaker.IGUANA => AnimationName.Sit,
            Speaker.GORILLA => AnimationName.Idle_B,
            Speaker.MONKEY => AnimationName.Idle_C,
            Speaker.PANTHER => AnimationName.Idle_A,
            _ => AnimationName.Idle_A,
        };
    }

    // This was also in your original code and might be needed
    public AnimationName GetAnimationForSpeaker()
    {
        return animationName != AnimationName.None
            ? animationName
            : GetDefaultSpeakingAnimation(speaker);
    }

    private AnimationName GetDefaultSpeakingAnimation(Speaker speaker)
    {
        return speaker switch
        {
            Speaker.DRAGON => AnimationName.Fly,
            Speaker.PIRANHA => AnimationName.Swim,
            Speaker.IGUANA => AnimationName.Sit,
            Speaker.GORILLA => AnimationName.Idle_B,
            Speaker.MONKEY => AnimationName.Idle_C,
            Speaker.PANTHER => AnimationName.Idle_A,
            _ => AnimationName.Idle_A,
        };
    }
}
