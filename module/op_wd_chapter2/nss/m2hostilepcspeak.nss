//::///////////////////////////////////////////////
//:: Conversation
//:: m2HostilePCSpeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound();
}
