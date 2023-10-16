//::///////////////////////////////////////////////
//:: Name act_q2d4brain_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has promised to fetch the mirror
    Return his helm and return him to the city.
    No adjustment to overmind Variables

    X2_Q2DOvermind - 0  : Not dealt with
    X2_Q2DOvermind - 1  : Killed
    X2_Q2DOvermind - 2  : Negotiated agreement
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 15, 2003
//:://////////////////////////////////////////////
#include "x2_inc_globals"

void main()
{
    object oPC = GetPCSpeaker();
    //Give PC back their helm so they won't get attacked
    if (GetLocalInt(oPC, "X2_Q2DGaveHelm") == 1)
    {
        //SetLocalInt(oPC, "X2_Q2DGaveHelm", 0);
        object oHelm = CreateItemOnObject("q2dmentalshield", oPC);
        SetIdentified(oHelm, TRUE);
        AssignCommand(oPC, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
    }
    //Teleport the PC
    object oTarget = GetWaypointByTag("wp_q2d2_hallteleport");
    SetLocalInt(oPC, "X2_Q2D_HallToCity", 1);
    effect eVis1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eVis2 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC);
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));

}

