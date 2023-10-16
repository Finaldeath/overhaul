//::///////////////////////////////////////////////
//:: Aribeth Door VFX (000), Heartbeat
//:: H2_HB_AriDoor000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bDoOnce == FALSE)
    {
        //Apply the VFX
        effect eGood = EffectVisualEffect(VFX_DUR_PROT_PREMONITION);
        effect eEvil = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGood, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEvil, OBJECT_SELF);

        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}
