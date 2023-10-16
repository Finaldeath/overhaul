//::///////////////////////////////////////////////
//:: Witchwork: Checkpoint Spawner
//:: WW_Checkpt_Spawn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns in the checkpoint placeables and
     beam effects, then destroys itself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2002
//:://////////////////////////////////////////////

void main()
{
    effect eTentacle = EffectVisualEffect(VFX_DUR_TENTACLE);

    //Create an Ethereal Leak object for the player to interact with.
    object oLeak = CreateObject(OBJECT_TYPE_PLACEABLE, "etherealleak", GetLocation(OBJECT_SELF));

    //Apply the tentacle effect at to the leak.
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTentacle, oLeak);

    //Destroy self now that everything's set up.
    DelayCommand(1.0, DestroyObject(OBJECT_SELF));
}
