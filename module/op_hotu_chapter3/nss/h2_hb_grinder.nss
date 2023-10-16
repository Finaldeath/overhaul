//::///////////////////////////////////////////////
//:: Quarry Grinder, Heartbeat
//:: H2_HB_Grinder.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If a Grinder's in working order, make it look
     like it's doing something.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

void main()
{
    int bActive = GetLocalInt(OBJECT_SELF, "bActivated");

    if (bActive == TRUE)
    {
        effect eVFX = EffectVisualEffect(VFX_IMP_STUN);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);
    }
}
