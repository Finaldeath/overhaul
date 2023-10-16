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
#include "x2_inc_cutscene"
#include "mimic_inc"

void main()
{
    object oPC = GetEnteringObject();
    object oTile;

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 8;
        int nRows = 8;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_ICE, nColumns, nRows, 0.05);
    }
    //"Ring effect" check
    HXAreaEnter(oPC);
}
