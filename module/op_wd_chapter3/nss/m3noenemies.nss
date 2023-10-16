//::///////////////////////////////////////////////
//:: Don't talk if enemies nearby
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns false if enemies within 10meters
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{

    object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    if (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetDistanceToObject(oCreature) <25.0)
        {
            return FALSE;
        }
    }
    return TRUE;
}
