//::///////////////////////////////////////////////
//:: Divining Pool, Heartbeat
//:: H1_HB_DivPool.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the ice effect to the Divining Pool
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 2, 2003
//:://////////////////////////////////////////////

void main()
{
    int bIceDoOnce = GetLocalInt(OBJECT_SELF, "bIceDoOnce");
    if (bIceDoOnce == FALSE)
    {
        effect eIce = EffectVisualEffect(VFX_DUR_ICESKIN);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eIce, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "bIceDoOnce", TRUE);
    }
}
