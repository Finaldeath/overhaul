//::///////////////////////////////////////////////
//:: Witch Wake 1: WW Handler, Un-Ghost Target
//:: WW_WWH_UnGhost.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Un-Ghosts the Handler's target. Note that
     this script will not remove Ghost effects
     applied by antone other than that Handler's
     activator, including the creature's OnSpawn
     script. Also, it will remove any other
     effects that you have created on that
     creature.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    effect eEffect = GetFirstEffect(oTarget);
    object oCreator = GetEffectCreator(eEffect);

    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (oCreator == OBJECT_SELF)
        {
            RemoveEffect(oTarget, eEffect);
        }

        eEffect = GetNextEffect(oTarget);
        oCreator = GetEffectCreator(eEffect);
    }
}
