//::///////////////////////////////////////////////
//:: m2q3H Guardian Conversation Abort Script
//:: m2q3H_Guardian
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ensures that the North Door is unlocked if
    the player chooses to abort the initial
    conversation, thereby hooping themselves out
    of a key.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oQuint = GetObjectByTag("M2Q3J_QUINT");
    object oKarlat = GetObjectByTag("M2Q3I_KARLAT");
    object oBelial = GetObjectByTag("M2Q3I_BELIAL");
    location lQuint = GetLocation(oQuint);
    location lKarlat = GetLocation(oKarlat);
    location lBelial = GetLocation(oBelial);
    object oDoor = GetObjectByTag("m2q3H_NorthDoor");

    SetLocked(oDoor, FALSE);

    if (GetLocalInt(OBJECT_SELF,"NW_L_JudgementMade") == 1)
    {
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
}
