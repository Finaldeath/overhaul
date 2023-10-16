//::///////////////////////////////////////////////
//:: Name : act_q2ealtar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
When the altar or the smoke plumes are touched,
initiate a dialogue with the using PC.
This dialogue will make it obvious that within the
smoke is some kind of portal to another dimension.
If the PC touches it, it will say that there is a roaring sound…
the PC is knocked down and an ice-storm affect hits the room
causing cold damage to everything within.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"
void main()
{
    object oPC = GetPCSpeaker();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 6.0);
    AssignCommand(oPC, PlaySound("as_na_steamlong1"));
    //Icestorm effects
    //Declare major variables

    int nCasterLvl = 15;
    int nDamage, nDamage2, nDamage3;
    int nVariable = 5;
    float fDelay;
    effect eExplode = EffectVisualEffect(VFX_FNF_ICESTORM); //USE THE ICESTORM FNF
    effect eVis = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eDam,eDam2, eDam3;
    //Get the ice storm target locations.
    location lTarget1 = GetLocation(GetWaypointByTag("wp_q2e_oaktree"));

    //Apply the ice storm VFX at the location captured above.
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget1);
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget1, TRUE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        fDelay = GetRandomDelay(0.75, 2.25);

        //Roll damage for each target
        nDamage = d6(5);
        nDamage2 = d6(3);
        nDamage3 = d6(nVariable);

        nDamage2 = nDamage2 + nDamage3;
        //Set the damage effect
        eDam = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
        eDam2 = EffectDamage(nDamage2, DAMAGE_TYPE_COLD);
        // Apply effects to the currently selected target.
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam2, oTarget));
        //This visual effect is applied to the target object not the location as above.  This visual effect
        //represents the impact that erupts on the target not on the ground.
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));


       //Select the next target within the spell shape.
      oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget1, TRUE, OBJECT_TYPE_CREATURE);



    }

}
