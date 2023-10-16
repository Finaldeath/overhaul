//::///////////////////////////////////////////////
//:: Name act_q1cook_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create one of the three ingredients on the PC
    that are needed for Drogan's cure.
    Update quest depending on if the PC has recovered
    the other ingredient yet.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q1cureing3", oPC);
    SetLocalInt(OBJECT_SELF, "nCureGiven", 1);
    if (GetLocalInt(GetModule(), "X1_Q1CURE1") == 1)
    {
        SetLocalInt(GetModule(), "X1_Q1CURE1", 2);
        AddJournalQuestEntry("q1cure", 40, oPC);
    }
    else
    {
        SetLocalInt(GetModule(), "X1_Q1CURE1", 1);
        AddJournalQuestEntry("q1cure", 20, oPC);
    }
}
