//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_toollib"

void StartCutscene(object oPC, int iCut);

void main()
{
    object oPC = GetEnteringObject();

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 14;
        int nRows = 12;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_LAVA, nColumns, nRows, 0.1);

        // Apply effect to body.
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), GetObjectByTag("hx_puzzle_sphere"));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELLTURNING), GetObjectByTag("hx_squash_corpse"));
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
