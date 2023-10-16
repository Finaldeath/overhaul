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

    //If exploded within 5 meters of the inner gates 'q2ainnergate' then the pc has betrayed the rebels,
    //like it or not - start the betrayal cutscene
    object oGate = GetObjectByTag("q2ainnergate");
    location lGate = GetLocation(oGate);

    if (GetTag(GetArea(OBJECT_SELF)) == "q2a_city1")
    {
        if (GetIsObjectValid(oGate) == TRUE)
        {
            if (GetDistanceBetween(OBJECT_SELF, oGate) < 5.0)
            {
                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

                //RewardXP to the party
                if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
                {
                    Reward_2daXP(oPC, 16, TRUE);
                }

                //Add the journal entry 'q2abattle', state 20
                AddJournalQuestEntry("q2abattle", 20, oPC);

                //Start the Betrayal Cutscene.
                //don't show the summoning scene should it happen
                SetLocalInt(GetModule(), "NoShowCutscene105", 1);
                //Variable so Gate knows it was blown up by a powderkeg
                SetLocalInt(GetModule(), "X2_Battle1PowderKeg", 1);
                ExecuteScript("cutscene103", oPC);
                SetLocalInt(OBJECT_SELF, "nStartCutscene", 1);
            }
        }
    }

    //If we have not triggered the cutscene - explode as normal
    if (GetLocalInt(OBJECT_SELF, "nStartCutscene") == 1)
        return;

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
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
        oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }

}
