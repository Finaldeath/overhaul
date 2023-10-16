//::///////////////////////////////////////////////
//:: Name q1h_giveherbs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create two of the three ingredients on the PC
    that are needed for Drogan's cure.
    Update quest depending on if the PC has recovered
    the other ingredient yet.
*/
//:://////////////////////////////////////////////
//:: Created By:  David Gaider
//:: Created On:  Feb 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oTongue = GetItemPossessedBy(OBJECT_SELF, "q1cureing1");
    object oCharcoal = GetItemPossessedBy(OBJECT_SELF, "q1cureing2");

    // give whichever items he has to the PC
    ClearAllActions();
    ActionPauseConversation();
    if (GetIsObjectValid(oTongue))
    {
        ActionGiveItem(oTongue, oPC);
    }
    if (GetIsObjectValid(oCharcoal))
    {
        ActionGiveItem(oCharcoal, oPC);
    }
    ActionResumeConversation();

    // set it so that the herbalist doesn't give any more herbs
    SetLocalInt(OBJECT_SELF, "nCureGiven", 1);

    // update the journal entries
    if (GetLocalInt(GetModule(), "X1_Q1CURE1") == 1)
    {
        SetLocalInt(GetModule(), "X1_Q1CURE1", 2);
        AddJournalQuestEntry("q1cure", 40, oPC);
    }
    else
    {
        SetLocalInt(GetModule(), "X1_Q1CURE1", 1);
        AddJournalQuestEntry("q1cure", 30, oPC);
    }
}

