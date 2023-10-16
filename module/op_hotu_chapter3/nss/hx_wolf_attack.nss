//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: hx_wolf_attack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 23, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    DetermineCombatRound();
}

