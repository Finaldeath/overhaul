//::///////////////////////////////////////////////
//:: Use the Ice Phylactery
//:: act_q5tymo_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Use the Ice Phylactery to polymorph into a
    frost giant.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetLocalObject(oPC, "X1_Phylac");

    object oDragon = GetNearestObjectByTag("NW_DRGWHITE001", oPC);

    SetLocalObject(GetModule(), "X1_POLY_FROST_GIANT", oPC);
    SetLocalInt(oPC, "X1_nPolymorphGiant", 1);
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly;
    if (GetGender(oPC) == GENDER_MALE)
        ePoly = EffectPolymorph(44);
    else
        ePoly = EffectPolymorph(45);
    effect eLink = EffectLinkEffects(ePoly, eVis);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);

    DestroyObject(oItem);
    ChangeToStandardFaction(oDragon, STANDARD_FACTION_HOSTILE);
    AssignCommand(oDragon, DetermineCombatRound());
}


