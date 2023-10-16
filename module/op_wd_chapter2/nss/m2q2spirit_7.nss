//::///////////////////////////////////////////////
//:: Death
//:: M2Q2Spirit_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 15, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oAltar = GetObjectByTag("M2Q2F2_ALTAR");

    SetLocalInt(GetModule(),"NW_M2Q2E_WoodsFreed",10);
    SetLocalInt(GetModule(),"NW_M2Q2E_SpiritDead",10);
    SetLocalInt(oAltar,"NW_L_DaggerReturned",2);
    AdjustReputation(oPC,GetObjectByTag("M2Q2G_INVISIBLE"),50);
    AdjustReputation(oPC,GetObjectByTag("M2Q2G_INVISIBLE2"),50);
    AdjustReputation(oPC,GetObjectByTag("M2Q2EAawill1"),100);
    DestroyObject(GetObjectByTag("M2Q2F2_M2Q2G"));
    DestroyObject(GetObjectByTag("M2Q2F2_Portal"));
    AddJournalQuestEntry("m2q2_Main", 93, oPC);
    SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(200));

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
}
