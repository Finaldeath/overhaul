//::///////////////////////////////////////////////
//:: Name  q2b_ent_tamtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        When a PC crosses this trigger he/she will notice
        that tamsil is stone.
        Journal entry and variable for conversation set
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 12/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(GetModule(), "NW_TAMSILGONE", 30);
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        AddJournalQuestEntry("findtamsil", 20, oPC);
    }
}
