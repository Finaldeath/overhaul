//::///////////////////////////////////////////////
//:: Name act_sharwyn_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Sharwyn leaves the dungeon
can be found inside the inn
set module global "q2a_Sharwyn_Lives" to 2 (she lives but hates the PC)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "q2a_Sharwyn_Lives", 2);
    object oSelf = OBJECT_SELF;
    object oTarget = GetWaypointByTag("wp_level1_ypexit");
    object oYPTarget = GetWaypointByTag("wp_yp_q2bsharwyn");
    ActionMoveToObject(oTarget, TRUE);
    DelayCommand(5.0, ClearAllActions(TRUE));
    DelayCommand(5.5, JumpToObject(oYPTarget));
    int nHealAmount = GetMaxHitPoints() - GetCurrentHitPoints();
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHealAmount), oSelf));
}
