//::///////////////////////////////////////////////
//:: builds an item
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At this point assumes that there is a valid item
    to be built
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 19 2001
//:://////////////////////////////////////////////

#include "NW_O0_ITEMMAKER"

void main()
{
   ActionPauseConversation();
   ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
   //DelayCommand(4.0, ActionAttack(OBJECT_INVALID));
   ActionMoveToObject(GetNearestObjectByTag("sM3Q1MyForge"));
   ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
   //ActionAttack(GetNearestObjectByTag("sM3Q1MyForge")) ;
   //SurrenderToEnemies();
   CreateForgeItem();
   ActionResumeConversation();
}
