//::///////////////////////////////////////////////
//:: Wind Pillar (Heartbeat)
//:: Hb_WindPillar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Play the VFX for the Wind Pillars on 2nd
     Floor of Temple of the Winds
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////

void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (iDoOnce == FALSE)
    {
        effect eVFX1 = EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD);
        effect eVFX2 = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR );
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX1, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX2, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);
    }
}
