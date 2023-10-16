//::///////////////////////////////////////////////
//:: M3Q4_CHIEFTAIN_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
    & makes 'friendly' giants unfriendly.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oGiant = GetNearestObjectByTag("M3Q4_D16HillGiant");
    object oEttin = GetNearestObjectByTag("M3Q4D10_ETTIN");
    if (GetIsObjectValid(oGiant))
    {
        AdjustReputation(oPC,oGiant,-100);
    }
    if (GetIsObjectValid(oEttin))
    {
        AdjustReputation(oPC,oEttin,-100);
    }
}
