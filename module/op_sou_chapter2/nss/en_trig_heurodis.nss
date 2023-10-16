//::///////////////////////////////////////////////
//:: Heurodis Trigger (OnEnter)
//:: En_Trig_Heurodis.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger Heurodis' conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 26, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");

    if (GetIsPC(oPC) == TRUE && bDoOnce == FALSE)
    {
        AssignCommand(oPC, ClearAllActions());

        object oDialog = GetNearestObjectByTag("Heurodis", oPC);
        AssignCommand(oDialog, ActionStartConversation(oPC, "heurodis2"));
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}
