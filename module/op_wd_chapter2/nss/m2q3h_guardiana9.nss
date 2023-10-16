//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #9
//:: m2q3H_GuardianA9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All members of the court disappear. This will
    be made flashier at a later date.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oQuint = GetObjectByTag("M2Q3J_QUINT");
    object oKarlat = GetObjectByTag("M2Q3I_KARLAT");
    object oBelial = GetObjectByTag("M2Q3I_BELIAL");
    location lQuint = GetLocation(oQuint);
    location lKarlat = GetLocation(oKarlat);
    location lBelial = GetLocation(oBelial);

    SignalEvent(GetObjectByTag("M2Q3GCHARWOOD"),EventUserDefined(300));
    SignalEvent(GetObjectByTag("M2Q3G03INN"),EventUserDefined(300));
    SignalEvent(GetObjectByTag("M2Q3G04MAYOR"),EventUserDefined(300));
    SignalEvent(GetObjectByTag("MAP_M2Q3GE"),EventUserDefined(300));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),lQuint);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),lKarlat);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_IMPLOSION),lBelial);
    DelayCommand(0.8,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lBelial));

    DestroyObject(oBelial);
    DestroyObject(oKarlat);
    DestroyObject(oQuint);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWKILL),OBJECT_SELF);
    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL_GREATER),GetLocation(OBJECT_SELF)));
    DelayCommand(1.0,DestroyObject(OBJECT_SELF));
}
