//::///////////////////////////////////////////////
//:: Name q3b_hb_fireped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Fire pedestal heartbeat.  If there is
        a PC in the trigger - create the vfx
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 4/03
//:://////////////////////////////////////////////
void CreateVfx(location lTarget);
void main()
{
    //if there is a pc in the trigger - do your stuff
    if (GetLocalInt(OBJECT_SELF, "X1_Q3B_NUMPC") > 0)
    {
        location lFireped = GetLocation(GetObjectByTag("q3b_fireped"));
        DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lFireped));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE), lFireped);
        DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lFireped));
        DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE), lFireped));

    }

}

