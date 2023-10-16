//::///////////////////////////////////////////////
//:: Destroyed Brazier
//:: 2Q6E_Brazier
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the local on Nyphithys to say the brazier
    is destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    object oTarget = GetObjectByTag("2Q6_Nyphithys");
    if(GetIsObjectValid(oTarget))
    {
        effect eVis = EffectVisualEffect(VFX_FNF_PWSTUN);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
        SetLocalInt(oTarget, "Freeing_Nyphithys", 3);
        object oLight = GetNearestObjectByTag("2q6f_DevilTrap");
        if(GetIsObjectValid(oLight))
        {
            DestroyObject(oLight, 0.0);
        }
    }
}
