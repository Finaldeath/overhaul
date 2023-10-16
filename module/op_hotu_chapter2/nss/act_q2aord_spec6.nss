//::///////////////////////////////////////////////
//:: Name act_q2aord_spec6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump Deva/golems to the Seer for battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oCreature = OBJECT_SELF;
    object oRunTo = GetWaypointByTag("wp_bat1_rebspawn");
    ClearAllActions();
    //DelayCommand(1.0, ActionForceMoveToObject(oRunTo, TRUE, 1.0, 4.0));
    object oGate = GetObjectByTag("q2ainnergate");
    //if(!GetIsOpen(oGate))
    //{
    //    SetLocked(oGate, FALSE);
    //    DelayCommand(1.5, AssignCommand(oGate, ActionOpenDoor(oGate)));
    //}

    effect eJump = EffectDisappear();

    if (GetTag(oCreature) == "q2dlavoera")
    {
        SetLocalInt(GetModule(), "X2_Battle2DevaWithSeer", 1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eJump, oCreature);
    }
    else if (GetTag(oCreature) == "q2a_bat_fleshgol")
    {
        DestroyObject(OBJECT_SELF);
        SetLocalInt(GetModule(), "X2_Battle2Golem1WithSeer", 1);
    }
    else
    {
        DestroyObject(OBJECT_SELF);
        SetLocalInt(GetModule(), "X2_Battle2Golem2WithSeer", 1);
    }

}
