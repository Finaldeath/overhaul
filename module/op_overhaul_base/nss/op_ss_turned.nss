//:://////////////////////////////////////////////
//:: Turned State Script
//:: op_ss_turned
//:://////////////////////////////////////////////
/*
    This heartbeat script fires when EffectTurned is the highest priority
    state applied to a creature.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

void main()
{
    // SpeakString("Turned State Script");

    // Allow the target to recieve commands for the round
    SetCommandable(TRUE);

    ClearAllActions();
    int nCnt = 1;

    // Get the nearest creature to the affected creature
    object oTarget  = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, nCnt);
    float fDistance = GetDistanceBetween(OBJECT_SELF, oTarget);

    while (GetIsObjectValid(oTarget) && fDistance < 5.0)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oTarget);
        if (GetIsEnemy(oTarget) && fDistance <= 5.0)
        {
            // Run away if they are an enemy of the target's faction
            ActionMoveAwayFromObject(oTarget, TRUE);
            break;
        }

        // If not an enemy interate and find the next target
        nCnt++;
        oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, nCnt);
    }

    // Disable the ability to recieve commands.
    SetCommandable(FALSE);
}
