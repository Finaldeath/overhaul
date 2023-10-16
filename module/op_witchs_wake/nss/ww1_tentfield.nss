//::///////////////////////////////////////////////
//:: Witchwork 1: Tentacle Field Spawner
//:: WW1_TentField.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns in the a field of tentacles, then
     destroys itself. Does not spawn in Ethereal
     Leaks
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 25, 2002
//:://////////////////////////////////////////////

void main()
{
    effect eVFX = EffectAreaOfEffect(AOE_PER_EVARDS_BLACK_TENTACLES, "NoScript", "NoScript", "NoScript");
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVFX, GetLocation(OBJECT_SELF));

    //Destroy self now that everything's set up.
    DelayCommand(1.0, DestroyObject(OBJECT_SELF));
}
