//::///////////////////////////////////////////////
//:: Name act_sharwyn_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Sharwyn leaves the dungeon
can be found inside the inn
set module global "q2a_Sharwyn_Lives" to 1
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "q2a_Sharwyn_Lives", 1);
    object oTarget = GetWaypointByTag("wp_level1_ypexit");
    object oYPTarget = GetWaypointByTag("x2_l_henchstart");    // changed BK oct 9
    object oSelf = OBJECT_SELF;
    //ActionMoveToObject(oTarget, TRUE);
    //SetCommandable(FALSE, oSelf);
    //DelayCommand(5.3, SetCommandable(TRUE, oSelf));
    //DelayCommand(6.0, ClearAllActions(TRUE));
    //DelayCommand(5.5, JumpToObject(oYPTarget));
    JumpToObject(oYPTarget);
    int nHealAmount = GetMaxHitPoints() - GetCurrentHitPoints();
    DelayCommand(6.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHealAmount), oSelf));


}
