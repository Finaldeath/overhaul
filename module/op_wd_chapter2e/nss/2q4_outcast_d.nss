//::///////////////////////////////////////////////
//:: Ghoul Outcast Custom User Defined Event
//:: 2q4_outcast_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the ghoul spout pro PC lines of an insane
    nature.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1002) // PERCEIVE
    {
        if(!IsInConversation(OBJECT_SELF))
        {
            SpeakOneLinerConversation("2q4_outcast_rand");
            SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT, FALSE);
        }
    }
    else if(nUser == 1007)
    {
        object oPC = GetLastKiller();
        if(GetIsObjectValid(oPC))
        {
            AddJournalQuestEntry("m2q4_Ghouls", 40, oPC);
        }
    }

}

