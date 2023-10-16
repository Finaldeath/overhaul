//::///////////////////////////////////////////////
//:: Name act_q2aord_spec5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this unit order his troops to move to the
    Right Inner Tower.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oTarget = GetObjectByTag("bat1_innertowerrighttarget");
    SetLocalObject(OBJECT_SELF, "oMoveTarget", oTarget);
    DelayCommand(1.0, ActionForceMoveToObject(oTarget, TRUE));
}
