//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: 2q4_hostile_jad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    DetermineCombatRound();
}
