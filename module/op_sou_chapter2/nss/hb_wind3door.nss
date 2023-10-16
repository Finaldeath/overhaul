//::///////////////////////////////////////////////
//:: Temple Door, 3rd Floor (Heartbeat)
//:: Hb_Wind3Door.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the VFX to the doors.
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
        effect eVFX = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);
    }
}
