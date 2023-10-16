//::///////////////////////////////////////////////
//:: Aribeth Change
//:: 2q6k_aribethchg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Aribeth changes into a Black Guard.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 18, 2002
//:://////////////////////////////////////////////
#include "nw_i0_hostincl"

void CreateAribeth(location lLocal);

void main()
{
    DelayCommand(2.0, SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 10));

    object oAribeth = GetNearestObjectByTag("2Q6K_Aribeth");
    location lLocal = GetLocation(oAribeth);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);

    ActionCastFakeSpellAtObject(SPELL_WEIRD, oAribeth);

    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal));

    DestroyObject(oAribeth, 2.5);

    DelayCommand(2.5, CreateAribeth(lLocal));


}

void CreateAribeth(location lLocal)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2q6k_aribeth001", lLocal);
}
