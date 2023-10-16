//::///////////////////////////////////////////////
//:: Name  act_daelan_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Daelan goes back to the inn
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  July 16/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "q2a_Daelan_Lives", 1);
    object oTarget = GetWaypointByTag("wp_q2bdaelan_exit");
    object oYPTarget = GetWaypointByTag("x2_l_henchstart");   // changed BK oct 9
    ActionForceMoveToObject(oTarget, TRUE, 1.0, 6.0);
    DelayCommand(6.2, ClearAllActions(TRUE));
    DelayCommand(6.5, JumpToObject(oYPTarget));
}
