//::///////////////////////////////////////////////
//:: Name hx_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the skele bones all glow, since
     they are hard to see.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oPC = GetEnteringObject();
    int iSeen = GetLocalInt(OBJECT_SELF, "HX_SkeleGlowSet");
    int x = 0;
    int y = 0;
    object oBones = GetObjectByTag("q4a_headstone", x);
    object oGarg = GetObjectByTag("NW_STATUE3", y);

    if(GetIsPC(oPC) && iSeen != 1)
    {
        SetLocalInt(OBJECT_SELF, "HX_SkeleGlowSet", 1);
        while(GetIsObjectValid(oBones))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE), oBones);
            x = x + 1;
            oBones = GetObjectByTag("q4a_headstone", x);
        }
        //while(GetIsObjectValid(oGarg))
        //{
        //    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oGarg);
        //    y = y + 1;
        //    oGarg = GetObjectByTag("NW_STATUE3", y);
        //}

        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_RED), GetObjectByTag("q4a_garg_skele1"));
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_RED), GetObjectByTag("q4a_garg_skele2"));
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_RED), GetObjectByTag("q4a_garg_skele3"));
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_RED), GetObjectByTag("q4a_garg_skele4x"));

        // Make the door glow.
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_BLUE_5), GetObjectByTag("hx_secret_door"));
    }
    // Added "ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
