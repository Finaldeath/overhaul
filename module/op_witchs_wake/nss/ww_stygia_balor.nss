//::///////////////////////////////////////////////
//:: Witchwork: Stygia Balor UserDefined
//:: WW_Stygia_Balor.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in a Stygian Lord to replace the Balor.

    Also takes into account the standard Balor
    OnDeath fireball (50 damage to all within
    20ft) as originally scripted by Preston
    Watamaniak.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 11, 2002
//////////////////////////////////////////////////
#include "NW_I0_SPELLS"

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {

        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {
            ////////////////////////////////////
            //BALOR FIREBALL
            ////////////////////////////////////
            //Declare major variables
            object oCaster = OBJECT_SELF;
            int nMetaMagic = GetMetaMagicFeat();
            int nDamage;
            float fDelay;
            effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
            effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
            effect eDam;
            //Get the spell target location as opposed to the spell target.
            location lTarget = GetLocation(OBJECT_SELF);
            //Limit Caster level for the purposes of damage
            //Apply the fireball explosion at the location captured above.
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
            //Declare the spell shape, size and the location.  Capture the first target object in the shape.
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
            //Cycle through the targets within the spell shape until an invalid object is captured.
            while (GetIsObjectValid(oTarget))
            {
               //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FIREBALL));
                //Get the distance between the explosion and the target to calculate delay
                fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;
                if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
                {
                    //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
                    nDamage = GetReflexAdjustedDamage(50, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_FIRE);
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
                 }
               //Select the next target within the spell shape.
               oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR);
            }

            ////////////////////////////////
            //STYGIAN CREATURE SPAWN
            ////////////////////////////////
            int iSpawn = Random(4)+1;
            object oSpawn = GetNearestObjectByTag("WP_Stygia_Large", OBJECT_SELF, iSpawn);
            location lSpawn = GetLocation(oSpawn);
            object oCenter = GetNearestObjectByTag("WP_StygiaSpawn");

            //Create a Stygian Lord to replace the Balor
            object oStygian = CreateObject(OBJECT_TYPE_CREATURE, "ww_sty_stygianlo", lSpawn, TRUE);
            AssignCommand(oStygian, ActionMoveToObject(oCenter, FALSE, 10.0));
            AssignCommand(oStygian, ActionRandomWalk());
        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
