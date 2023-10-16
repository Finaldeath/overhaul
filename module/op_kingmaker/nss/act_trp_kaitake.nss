//::///////////////////////////////////////////////
//:: act_trp_kaitake
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    have Trip run over and bend down and do the disarm trap animation.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetNearestObjectByTag("os_hen_kai");
    ActionPauseConversation();
    ActionMoveToObject(oKai,TRUE);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0,3.0);
    ActionResumeConversation();
}
