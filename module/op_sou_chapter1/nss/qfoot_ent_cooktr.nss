//::///////////////////////////////////////////////
//:: Name qfoot_ent_cooktr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   //check to see if dead cook has spawned inside of this trigger
//if so - send PC a message
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(GetModule(), "Captive_Cook") == 1 && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            FloatingTextStrRefOnCreature(40396, oPC);
            DestroyObject(OBJECT_SELF, 1.5);
            SetLocalInt(oPC, "X1_FoundMara", 1);
            AddJournalQuestEntry("q1dcook", 45, oPC, TRUE, TRUE);
        }
    }
}
