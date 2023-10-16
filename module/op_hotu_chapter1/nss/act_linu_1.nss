//::///////////////////////////////////////////////
//:: Name  act_linu_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Linu goes back to the inn
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  July 16/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "q2a_Linu_Lives", 1);
    object oTarget = GetWaypointByTag("wp_level2_linu");
    object oYPTarget = GetWaypointByTag("x2_l_henchstart");   // changed BK oct 9
    ActionForceMoveToObject(oTarget, TRUE, 1.0, 10.0);
    DelayCommand(10.2, ClearAllActions(TRUE));
    DelayCommand(10.5, JumpToObject(oYPTarget));
}
