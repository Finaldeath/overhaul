//::///////////////////////////////////////////////
//:: Name heart_grass
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Grass Tiles spawn in with grass effects on them
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:August 14/03
//:://////////////////////////////////////////////

#include "inc_plot_func"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_ONCE") == 0)
    {
        // * spawn in Grass Tile at better Z
        location lNewLoc = GetAdjustLocation(0.10, GetLocation(OBJECT_SELF));
        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "q5grasstile", lNewLoc);
        int nEffect = 402;
        effect eVis = EffectVisualEffect(nEffect);
        SetLocalInt(oNew, "NW_L_ONCE", 10);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNew);
        DestroyObject(OBJECT_SELF);
    }

}
