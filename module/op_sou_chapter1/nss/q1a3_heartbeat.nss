//::///////////////////////////////////////////////
//:: Name q1a3_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Drogan's Laboratory Heartbeat - On first heartbeat
    set up some visual effects on the rune stones.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        object oStone1 = GetObjectByTag("q1a3stone1");
        object oStone2 = GetObjectByTag("q1a3stone2");
        object oStone3 = GetObjectByTag("q1a3stone3");
        object oStone4 = GetObjectByTag("q1a3stone4");
        object oStone5 = GetObjectByTag("q1a3stone5");

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oStone1);
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oStone2));
        DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oStone3));
        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oStone4));
        DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_BLUR), oStone5));
    }
}
