//:://////////////////////////////////////////////
//:: Confused State Script
//:: op_ss_confuse
//:://////////////////////////////////////////////
/*
    This heartbeat script fires when EffectConfused is the highest priority state
    applied to a creature.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

void main()
{
    // SpeakString("Confused State Script");

    // Make sure the creature is commandable for the round
    SetCommandable(TRUE);
    // Clear all previous actions.
    ClearAllActions(TRUE);
    int nRandom = d10();
    // Roll a random int to determine this rounds effects
    if (nRandom == 1)
    {
        ActionRandomWalk();
    }
    else if (nRandom >= 2 && nRandom <= 6)
    {
        ClearAllActions(TRUE);
    }
    else if (nRandom >= 7 && nRandom <= 10)
    {
        ActionAttack(GetNearestObject(OBJECT_TYPE_CREATURE));
    }
    SetCommandable(FALSE);
}
