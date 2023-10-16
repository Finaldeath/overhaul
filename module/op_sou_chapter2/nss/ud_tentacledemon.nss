//::///////////////////////////////////////////////
//:: Tentacle Demon (User-Defined)
//:: UD_TentacleDemon.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Tentacle Demon VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void main()
{
    effect eWeird = EffectVisualEffect(VFX_FNF_WEIRD);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeird, OBJECT_SELF);
    DelayCommand(10.0, SignalEvent(OBJECT_SELF, EventUserDefined(5009)));
}
