//::///////////////////////////////////////////////
//:: Default:On Death
//:: 2q4d_voleron_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_PLOT"

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oPC = GetLastKiller();

    // Some extra safety checks in case Voleron is killed by an AOE spell/Trap/Associate
    // or something else other than a Player.
    if ( !GetIsObjectValid(oPC) || !GetIsPC(oPC) )
    {
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR , PLAYER_CHAR_IS_PC);
    }

    if ( !GetIsObjectValid(oPC) || !GetIsPC(oPC) )
    {
        oPC = GetFirstPC();
    }

    RewardXP("m2q4_Illusk",100,oPC);
    AddJournalQuestEntry("m2q4_Illusk",50,oPC);

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
