//::///////////////////////////////////////////////
//:: Death
//:: m2q1alhelor_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 25, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_O2_CONINCLUDE"

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);

    object oKiller = GetLastKiller();
    if (GetIsObjectValid(oKiller) == TRUE)
    {
        // * If I have a master then use him to determine the treasure
        if (GetIsObjectValid(GetMaster(oKiller)) == TRUE)
        {
            oKiller = GetMaster(oKiller);
        }
         // * generate boss treasure
         GenerateNPCTreasure(4, OBJECT_SELF, oKiller);
    }
    else
        AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("No Killer!"));

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
