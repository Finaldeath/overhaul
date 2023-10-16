//::///////////////////////////////////////////////
//:: Name  act_rissi_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Riisi will fly into the laboratory and fetch some
    items for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nFetchingItems", 1);
    ActionPauseConversation();
    object oWay = GetWaypointByTag("wp_riisi_hide");
    object oPC = GetPCSpeaker();
    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWay, TRUE));
    DelayCommand(6.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oPC, TRUE)));
    DelayCommand(10.5, ActionResumeConversation());
}
