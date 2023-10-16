//::///////////////////////////////////////////////
//:: Aribeth's Ice Cave (OnEnter)
//:: H2_En_IceCave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Freezes Aribeth when players enter (to ensure
     a more natural animation).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oEnterer = GetEnteringObject();
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bThawed = GetLocalInt(oAribeth, "bThawed");
    if (GetIsPC(oEnterer) == TRUE &&
        bThawed == FALSE)
    {
        //Remove any past freezing of her animation so it can be re-applied.
        effect eEffect = GetFirstEffect(oAribeth);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            //You'll be able to identify it b/c it was applied by the area.
            object oCreator = GetEffectCreator(eEffect);
            if (oCreator == OBJECT_SELF)
            {
                RemoveEffect(oAribeth, eEffect);
            }

            //Update the loop variable.
            eEffect = GetNextEffect(oAribeth);
        }

        //Put her into a visually interesting pose
        AssignCommand(oAribeth, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 10.0));

        //Apply the Ice texture to her
        effect eIce = EffectVisualEffect(465);
        AssignCommand(oAribeth, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eIce, oAribeth));

        //Freeze her animations
        effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
        DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFreeze, oAribeth));
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oEnterer));
}
