//::///////////////////////////////////////////////
//:: M3Q1Smith1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    works at his forge when not busy.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{

    if ( (CanSeePlayer() == TRUE) && (!IsInConversation(OBJECT_SELF)) && (!GetIsInCombat(OBJECT_SELF)))
    {
        int nRandom = Random(100) + 1;
       if (nRandom < 50)
       {
        ClearAllActions();
        //ActionMoveToObject(GetNearestObjectByTag("sM3Q1MyForge"));
        ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW);
        //ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
       }
       else if (nRandom >=51 && nRandom <=70)
       {
        ClearAllActions();
        //ActionAttack(GetNearestObjectByTag("sM3Q1MyForge")) ;
       ActionMoveToObject(GetNearestObjectByTag("sM3Q1MyForge"));
        ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3);
       }
       else if (nRandom >=71 && nRandom <=80)
       {
      //  ActionRandomWalk();
        ClearAllActions();
        ActionMoveAwayFromObject(GetNearestObjectByTag("sM3Q1MyForge"), FALSE,3.0);
       }
       else
       {
        // * Do Nothing
        ClearAllActions();
       }
    }

}
