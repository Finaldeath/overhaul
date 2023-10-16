//::///////////////////////////////////////////////
//:: Name hx_ice_bash2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will break the ice down that is
     blocking the exit. Only if the PC is in Elem
     form will this work.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 21, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
void RemoveIce(object oSelf);
void CheckIce(object oSelf);

void main()
{
    object oSelf = OBJECT_SELF;
    object oPC = GetLastAttacker();
    object oBash = GetNearestObjectByTag("hx_bash_target");
    int iAppearance = GetAppearanceType(oPC);

    if(GetIsPC(oPC))
    {
        if(GetCurrentAction(oPC) == ACTION_ATTACKOBJECT && GetLocalInt(OBJECT_SELF, "HX_ICE_IN_USE") != 1)
        {

            if(CheckGiant(oPC))
            {
                //AssignCommand(oPC, ClearAllActions(TRUE));
                SetLocalInt(OBJECT_SELF, "HX_ICE_IN_USE", 1);
                SetCutsceneMode(oPC, TRUE);
                //SetCameraFacing(GetFacing(oPC), -1.0, -1.0, CAMERA_TRANSITION_TYPE_MEDIUM);
                SetPlotFlag(OBJECT_SELF, FALSE);
                //AssignCommand(oPC, ClearAllActions(TRUE));
                //DelayCommand(1.0, AssignCommand(oPC, DoPlaceableObjectAction(oSelf, PLACEABLE_ACTION_BASH)));
                DelayCommand(0.7, AssignCommand(oPC, ClearAllActions(TRUE)));
                DelayCommand(0.3, RemoveIce(oSelf));
                //DelayCommand(3.0, CheckIce(oSelf));
                DelayCommand(2.0, SetCutsceneMode(oPC, FALSE));
                DelayCommand(2.0, DestroyObject(OBJECT_SELF));
            }
             // Tell them they need to be big to break through.
            else
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                ActionStartConversation(oPC);
            }
        }
    }
}

void RemoveIce(object oSelf)
{
    object oControl = GetObjectByTag("hx_ice_control");
    int x = 1;
    object oIce = GetNearestObjectByTag("hx_ice_block", oControl, x);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oSelf);

    while(GetIsObjectValid(oIce) && x < 30)
    {
        SetPlotFlag(oIce, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oIce);
        x = x + 1;
        oIce = GetNearestObjectByTag("hx_ice_block", oControl, x);
    }

}

void CheckIce(object oSelf)
{
    object oBlock = GetObjectByTag("hx_ice_block");

    // Check to see if any blocks are left.
    if(!GetIsObjectValid(oBlock))
    {
        SetPlotFlag(oSelf, FALSE);
        DestroyObject(oSelf);
    }
}
