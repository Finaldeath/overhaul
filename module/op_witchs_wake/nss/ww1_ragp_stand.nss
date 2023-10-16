//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Stand
//:: WW1_Ragp_Stand.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the Ragpicker stand up.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oRagpicker = GetNearestObjectByTag("Ragpicker");

    AssignCommand(oRagpicker, ActionPauseConversation());
    AssignCommand(oRagpicker, PlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD));
    AssignCommand(oRagpicker, ActionResumeConversation());
}
