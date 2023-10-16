//::///////////////////////////////////////////////
//:: Name q2b03_detonate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Barrel Explosion
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
void main()
{
    if (GetLocalInt(OBJECT_SELF,"GZ_OBJECT_DETONATING") == TRUE)
        return; // prevent recursions

    SetLocalInt(OBJECT_SELF,"GZ_OBJECT_DETONATING",TRUE);
    location lLoc = GetLocation(OBJECT_SELF);
    effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL,FALSE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eBoom, lLoc);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eDam;
    float fDelay;
    int nDamage;
    //From here we use a modified version of Noel Borstad's fireball script
    effect eDest = EffectDeath();
    DelayCommand(0.3f,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDest,OBJECT_SELF));
    //PlaySound("sim_explsun");
    PlaySound("as_cv_bldgcrumb3");
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the spell shape until an invalid object is captured.

    while (GetIsObjectValid(oTarget))
    {
        if (!GetPlotFlag(oTarget))
        {
            //Fire cast spell at event for the specified target
           //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FIREBALL));
            //Get the distance between the explosion and the target to calculate delay
            fDelay = GetDistanceBetweenLocations(lLoc, GetLocation(oTarget))/20;
            //Roll damage for each target, but doors are always killed
            if  (GetObjectType(oTarget) == OBJECT_TYPE_DOOR)
                nDamage = GetCurrentHitPoints(oTarget)+1;
            else
                nDamage = d6(5)+5;
            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_FIRE);
            //Set the damage effect
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
            if(nDamage > 0)
            {
                // Apply effects to the currently selected target.
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                //This visual effect is applied to the target object not the location as above.  This visual effect
                //represents the flame that erupts on the target not on the ground.
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            }
        //Select the next target within the spell shape.
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }

}
