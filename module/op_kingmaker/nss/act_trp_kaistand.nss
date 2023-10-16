//::///////////////////////////////////////////////
//:: act_trp_kaistand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala stands back up
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetNearestObjectByTag("os_hen_kai");
    ActionPauseConversation();
    AssignCommand(oKai,ClearAllActions(TRUE));
    ActionResumeConversation();
}
