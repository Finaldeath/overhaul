//::///////////////////////////////////////////////
//:: Sleeping Dwarf: On Spawn In
//:: q2dwarfsleep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in Scrip for Dwarves in Q2B06 to make them
    appear asleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: September 21, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //Apply a sleep effect to the dwarf when they spawn in.
    effect eEffect = EffectSleep();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, OBJECT_SELF);
    //Call their heartbeat event to show Zzzzs over their heads
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
    SetIsDestroyable(FALSE, FALSE, TRUE);
}


