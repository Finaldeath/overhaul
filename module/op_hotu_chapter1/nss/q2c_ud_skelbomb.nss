//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2c_ud_skelbomb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Skeleton bomb will track a PC - and blow up
    when within 4 meters
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "NW_I0_SPELLS"

void DoSmoke();
void Explode();
void DoDistanceCheck();

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nIgnite") != 1)
        {
            //ignite and unequip the torch
            effect eFire = EffectBeam(VFX_BEAM_FIRE,OBJECT_SELF,  BODY_NODE_CHEST);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFire,OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "nIgnite", 1);
            object oTorch = GetItemPossessedBy(OBJECT_SELF, "NW_IT_TORCH001");

            ClearAllActions();
            ActionUnequipItem(oTorch);
        }

        DoSmoke();
        DoDistanceCheck();
        DelayCommand(2.0, DoDistanceCheck());
        DelayCommand(4.0, DoDistanceCheck());
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

        if (GetLocalInt(OBJECT_SELF, "nDone") == 1)
            return;
        if (GetLocalInt(OBJECT_SELF, "nIgnite") == 1)
        {
            Explode();
        }
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_weathmark", GetLocation(OBJECT_SELF));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
void DoSmoke()
{
    effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eSmoke,OBJECT_SELF);
}

void Explode()
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
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 35, SAVING_THROW_TYPE_FIRE);
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

void DoDistanceCheck()
{
    if (GetLocalInt(OBJECT_SELF, "nIgnite") == 1)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (GetDistanceToObject(oPC) < 4.0)
        {
            Explode();
        }
    }
}

