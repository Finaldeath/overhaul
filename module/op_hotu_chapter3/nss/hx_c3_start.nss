//::///////////////////////////////////////////////
//:: x2_c3_start
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At the start of Chapter 2 load the
    henchmen from Chapter 1 in.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////
#include "x2_inc_globals"
#include "hx_inc_ring"

void main()
{
    //Do Once.
    if (GetLocalInt(OBJECT_SELF, "NW_L_FLOOD") == 0)
    {
        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "NW_L_FLOOD", 10);

        //Load in the Henchmen from Ch2.
        object oPC = OBJECT_SELF;
        RestoreAllHenchmen(GetLocation(OBJECT_SELF), oPC);

        //Apply VFX to Gate Portals
        int nCount;
        object oDoor;
        for (nCount = 0; nCount < 6; nCount++)
        {
            oDoor = GetObjectByTag("x2_reapdoor" + IntToString(nCount));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED), oDoor);
        }
    }
    object oPC = GetEnteringObject();

    //"Ring effect" check
    HXAreaEnter(oPC);

    ExecuteScript("x2_c3_start", OBJECT_SELF);
}
