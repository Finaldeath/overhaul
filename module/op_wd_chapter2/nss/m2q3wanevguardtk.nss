//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q3WanevGuardTK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard is talking.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 22, 2001
//:://////////////////////////////////////////////

void main()
{
    int nRand = Random(16);

    if (!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        switch (nRand)
        {
            case 0: case 1: case 2: case 3:
                ClearAllActions();
            break;
            case 4: case 5:
                ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL,1.0,3.0);
            break;
            case 6:
                ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING,1.0,3.0);
            break;
            case 7:
                ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL,1.0,3.0);
            break;
            case 8: case 9:
                ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
            break;
            case 10: case 11:
                ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
            break;
            case 12:
                ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
            break;
            case 13:
                ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED);
            break;
            case 14: case 15:
                ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
            break;
        }
    }
}
