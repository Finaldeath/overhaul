//::///////////////////////////////////////////////
//:: Name q1a2_trig_xantrp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On trigger of this trap - if Xanos is in the
    party - he has an interjection
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 27/03
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"
void main()
{
        //Declare major variables
    int nDuration = 3;
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    effect eSlow = EffectSlow();
    effect eVis = EffectVisualEffect(VFX_IMP_SLOW);

    //Find first target in the size
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lTarget);
    //Cycle through the objects in the radius
    while (GetIsObjectValid(oTarget))
    {
        if(! MySavingThrow(SAVING_THROW_REFLEX, oTarget, 20, SAVING_THROW_TYPE_NONE))
        {
            //Apply slow effect and slow effect
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSlow, oTarget, RoundsToSeconds(nDuration));
        }
        //Get next target in the shape.
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_SMALL, lTarget);
    }

    object oPC = GetEnteringObject();
    object oHench = GetHenchman(oPC);
    if (GetIsObjectValid(oHench) != FALSE)
    {
        if (GetTag(oHench) == "x0_hen_xan")
        {
            AssignCommand(oHench, SpeakStringByStrRef(40376));
        }
    }

}
