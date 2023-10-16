//::///////////////////////////////////////////////
//:: User Defined
//:: NW_TAG_CHILDD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will make the child play a game of
    tag.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oIT = GetLocalObject(GetArea(OBJECT_SELF),"NW_A_TAG_I_AM_IT");
    object oChild = GetNearestObjectByTag("NW_TAG_CHILD",OBJECT_SELF);

    if (GetIsObjectValid(oChild) && oIT == OBJECT_SELF)
    {
        if (GetDistanceToObject(oChild) > 3.0)
        {
            ClearAllActions();
            ActionMoveToObject(oChild,TRUE);
            ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(100)));
        }
        else
        {
            SpeakOneLinerConversation();
            PlayAnimation(ANIMATION_FIREFORGET_STEAL);
            DelayCommand(2.0,SetLocalObject(GetArea(OBJECT_SELF),"NW_A_TAG_I_AM_IT",oChild));
            ActionMoveAwayFromObject(oChild,TRUE);
        }
    }
}
