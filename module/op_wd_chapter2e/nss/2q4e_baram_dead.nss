//::///////////////////////////////////////////////
//:: Flag that Baram is dead.
//:: 2Q4W_BARAM_DEAD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//
//  Set the local that Baram has been killed and
//  update the journal entries accordingly.
//
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 15, 2002
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"
#include "NW_I0_2Q4LUSKAN"
void main()
{
    SetLocalInt(GetModule(), "NW_2Q4_BARAM_IS_DEAD", 1);

    object oKiller = GetLastKiller();
    int iMainState = GetLocalInt(oKiller, "NW_JOURNAL_ENTRYm2q4_Main");

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
        //AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("No Killer!"));

    if (iMainState < 70)
    {
        AddJournalQuestEntry("m2q4_Main", 90, oKiller);
    }

    if (iMainState == 70 || iMainState == 80)
    {
        AddJournalQuestEntry("m2q4_Main", 110, oKiller);
    }
}
