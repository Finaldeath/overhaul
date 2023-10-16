//::///////////////////////////////////////////////
//:: Shadow Portal (User-Defined)
//:: UD_ShadowPortal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Play the Shadow Portal VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
{
    effect eVFX = EffectVisualEffect(VFX_FNF_IMPLOSION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);

    object oArea = GetArea(OBJECT_SELF);
    int bPortalsOn = GetLocalInt(oArea, "bPortalsOn");
    if (bPortalsOn == TRUE)
    {
        DelayCommand(3.5, SignalEvent(OBJECT_SELF, EventUserDefined(5006)));
    }
}
