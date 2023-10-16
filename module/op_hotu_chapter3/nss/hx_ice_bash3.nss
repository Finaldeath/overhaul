//::///////////////////////////////////////////////
//:: Name hx_ice_bash
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
void DoCutscene(object oSelf, object oPC, object oBash, int iAppearance);

void main()
{
    object oSelf = OBJECT_SELF;
    object oPC = GetLastUsedBy();
    object oBash = GetNearestObjectByTag("hx_bash_target");
    int iAppearance = GetAppearanceType(oPC);
    object oInvis = GetObjectByTag("hx_ice_wall_cut");

    if(GetIsPC(oPC))
    {
        AssignCommand(oInvis, DoCutscene(oSelf, oPC, oBash, iAppearance));
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

void DoCutscene(object oSelf, object oPC, object oBash, int iAppearance)
{
    AssignCommand(oPC, ClearAllActions(TRUE));
    if(CheckGiant(oPC))
    {
        SetCutsceneMode(oPC, TRUE);
        //SetCameraFacing(GetFacing(oPC), -1.0, -1.0, CAMERA_TRANSITION_TYPE_MEDIUM);
        //SetPlotFlag(oSelf, FALSE);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, DoPlaceableObjectAction(oSelf, PLACEABLE_ACTION_BASH));
        DelayCommand(1.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(1.2, RemoveIce(oSelf));
        //DelayCommand(3.0, CheckIce(oSelf));
        DelayCommand(4.0, SetCutsceneMode(oPC, FALSE));
        //DelayCommand(4.0, DestroyObject(oSelf));
    }
     // Tell them they need to be big to break through.
    else
    {
        AssignCommand(oSelf, ActionStartConversation(oPC));
    }
}
