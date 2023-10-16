//::///////////////////////////////////////////////
//:: PC Drinks
//:: os_act_pcdrinks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC plays the drinking animation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    ActionPauseConversation();
    AssignCommand(oPC,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
    ActionResumeConversation();

}
