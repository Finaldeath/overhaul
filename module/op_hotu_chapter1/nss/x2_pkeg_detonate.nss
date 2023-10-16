//::///////////////////////////////////////////////
//:: Name  x2_pkeg_detonate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Detonate the Powderkeg
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "NW_I0_SPELLS"
#include "x2_inc_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_OBJECT_DETONATING") == TRUE)
        return; // prevent recursions

    SetLocalInt(OBJECT_SELF,"X2_OBJECT_DETONATING",TRUE);
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
    PlaySound("sim_explsun");

    //If exploded within 5 meters of the boulders 'q2b03Boulder1' then destroy the blocking boulders
    object oBoulder1 = GetObjectByTag("q2b03Boulder1");
    location lBoulder1 = GetLocation(oBoulder1);

    if (GetTag(GetArea(OBJECT_SELF)) == "q2b_um1_north")
    {
        if (GetIsObjectValid(oBoulder1) == TRUE)
        {
            if (GetDistanceBetween(OBJECT_SELF, oBoulder1) < 5.0)
            {
                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                object oBoulder2 = GetObjectByTag("q2b03Boulder2");
                object oBarrel = GetObjectByTag("q2b03barrel");
                //RewardXP to the party
                if (GetPCTotalLevel(oPC) < 15)
                {
                    Reward_2daXP(oPC, 14, TRUE);
                }
                else
                {
                    Reward_2daXP(oPC, XP_HIGH, TRUE);
                }


                //Add the journal entry 'q2b03sealedpassage', state 20
                AddJournalQuestEntry("q2b03sealedpassage", 20, oPC);
                SetLocalInt(GetModule(), "X2_SealedPassageOpen", 1);
                object oLowerDoor = GetObjectByTag("at_level2_level1");
                SetLocked(oLowerDoor, FALSE);

                effect eDamage = EffectDamage(500);
                SetPlotFlag(oBoulder1, FALSE);
                SetPlotFlag(oBoulder2, FALSE);
                SetPlotFlag(oBarrel, FALSE);
                DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBoulder1));
                DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBoulder1));
                DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarrel));

                //DestroyObject(oBoulder1, 1.4);
                //DestroyObject(oBoulder2, 1.4);
            }
        }
    }
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
                if (GetTag(oTarget) =="x2_plc_pkeg")
                nDamage = d6(2); // lower chance to destroy other powerderkeg
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
