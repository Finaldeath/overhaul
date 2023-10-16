//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: NW_D1_tolan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes Tolan attack the person
    his is currently talking with (without causing
    all commoners to go hostile to the player).
*/
//:://////////////////////////////////////////////
//:: Created By: Craig Welburn
//:: Created On: Sep 07, 2005
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DetermineCombatRound();
}
