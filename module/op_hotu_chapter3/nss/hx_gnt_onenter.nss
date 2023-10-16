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
void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {

        BlackScreen(oPC);

        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        // Put lava in tiles.
        vector vPos;
        vPos.x = 55.0;
        vPos.y = 25.0;
        vPos.z = -0.02;
        float fFace = 0.0;
        location lLoc;
        lLoc = Location(GetArea(OBJECT_SELF), vPos, fFace);
        object oTile = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_walltile", lLoc);
        //object oTile = GetObjectByTag("hx_walltile");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(443), oTile);

        // Berry flame VFX
        int x = 1;
        object oFlame = GetNearestObjectByTag("hx_cookpot", oPC, x);

        while(GetIsObjectValid(oFlame))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PIXIEDUST), oFlame);
            x = x + 1;
            oFlame = GetNearestObjectByTag("hx_cookpot", oPC, x);
        }
        HXAreaEnter(oPC);
        ExecuteScript("hx_gwall_explode", OBJECT_SELF);

    }
    }

    //"Ring effect" check
    HXAreaEnter(oPC);
}
