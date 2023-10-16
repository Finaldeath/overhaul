//::///////////////////////////////////////////////
//:: Name act_pretalk_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All 4 adventurers will turn to face the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 8/03
//:://////////////////////////////////////////////

void main()
{
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oTomi = GetObjectByTag("pre_tomi");
    object oSharwyn = GetObjectByTag("pre_sharwyn");

    object oPC = GetPCSpeaker();

    ActionPauseConversation();
    AssignCommand(oDaelan, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oLinu, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oTomi, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oSharwyn, SetFacingPoint(GetPosition(oPC)));
    DelayCommand(0.5, ActionResumeConversation());
}
