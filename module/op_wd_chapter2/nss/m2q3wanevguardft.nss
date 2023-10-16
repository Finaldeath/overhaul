//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2q3WanevGuardFT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard is fighting the training dummy.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 22, 2001
//:://////////////////////////////////////////////

void main()
{
    int nRand = Random(3);

    if (!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        switch (nRand)
        {
            case 0:
                ClearAllActions();
                ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
            break;
            case 1:
                ActionAttack(GetObjectByTag("M2Q03PDUMMY01"));
            break;
            case 2:
                ActionAttack(GetObjectByTag("M2Q03PDUMMY02"));
            break;
        }
    }
}
