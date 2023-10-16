//::///////////////////////////////////////////////
//:: Name q3b_hb_waterped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Water pedestal heartbeat.  If there is
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
        object oWaterped = GetObjectByTag("q3b_waterped");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oWaterped);
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oWaterped));
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oWaterped));

    }

}

