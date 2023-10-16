//::///////////////////////////////////////////////
//:: Name q7_use_recharger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Use the recharger in the Hermit's House.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 31/03
//:://////////////////////////////////////////////

void main()
{
/*
    object oPC = GetLastOpenedBy();
    if (GetLocalInt(oPC, "nAwakened") == 0)
    {
        ActionStartConversation(oPC);
        AddJournalQuestEntry("awakenings", 20, oPC, FALSE);
        SetLocalInt(oPC, "nAwakened", 20);
    }
}
*/
    object oDialog = GetObjectByTag("q7rechargerdialog");
    object oPC = GetLastOpenedBy();
    if (GetLocalInt(oPC, "X1_Q7InRechargeCon") == 0)
    //if (IsInConversation(oDialog) == FALSE)
    {
        AssignCommand(oDialog, ActionStartConversation(oPC));
    }
    else
    {
        AssignCommand(oPC, ActionPauseConversation());
        OpenInventory(OBJECT_SELF, oPC);
        AssignCommand(oPC, ActionResumeConversation());
    }
}

