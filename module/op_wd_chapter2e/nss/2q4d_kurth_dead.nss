//::///////////////////////////////////////////////
//:: Flag that Kurth is dead.
//:: 2Q4W_KURTH_DEAD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//
//  Sets Kurth's Death local and updates the
//  appropriate journal entries.
//
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 15, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_O2_CONINCLUDE"

void main()
{
    SetLocalInt(GetModule(), "NW_2Q4_KURTH_IS_DEAD", 1);

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
        AddJournalQuestEntry("m2q4_Main", 70, oKiller);
    }

    if (iMainState == 90 || iMainState == 100)
    {
        AddJournalQuestEntry("m2q4_Main", 110, oKiller);
    }

    object oTolan = GetNearestObjectByTag("TolanLosen");
    if(GetIsObjectValid(oTolan))
    {
        DestroyObject(oTolan, 0.0);
    }

}
