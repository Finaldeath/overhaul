// explode golem power source


#include "X0_I0_SPELLS"
#include "x2_i0_spells"
#include "x2_inc_spellhook"


void Explode()
{
    SetPlotFlag(OBJECT_SELF, FALSE);
    // End of Spell Cast Hook
    //Declare major variables
    int nDamage1, nDamage2, nDamage3, nDamage4;
    float fDelay;
    effect eExplode = EffectVisualEffect(464);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    int nKnockDur;

    int nSpellDC = 32;

    effect eDam1, eDam2, eDam3, eDam4, eDam5, eKnock;
    eKnock = EffectKnockdown();
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(OBJECT_SELF);
    //Apply the fireball explosion at the location captured above.
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 20.0f, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    int nTotalDamage;
    while (GetIsObjectValid(oTarget))
    {
        if(spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, GetFirstPC()))
        {
            //Get the distance between the explosion and the target to calculate delay
            fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20 + 0.5f;
            if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
            {
                //Roll damage for each target
                nDamage1 = d6(40);
                nDamage2 = d6(40);

                if (MySavingThrow(SAVING_THROW_REFLEX,oTarget,nSpellDC,SAVING_THROW_TYPE_SPELL,OBJECT_SELF,fDelay) >0)
                {
                    nDamage1 /=2;
                    nDamage2 /=2;

                }
                nTotalDamage = nDamage1+nDamage2;
                //Set the damage effect
                eDam3 = EffectDamage(nDamage3, DAMAGE_TYPE_FIRE);
                eDam4 = EffectDamage(nDamage4, DAMAGE_TYPE_SONIC);
                //Link damage effects

                if(nTotalDamage > 0)
                {
                    if (nTotalDamage > 50)
                    {
                        nKnockDur = Random(6) + 4;
                        DelayCommand(fDelay+0.3f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, IntToFloat(nKnockDur)));
                    }

                    // Apply effects to the currently selected target.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam1, oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam2, oTarget));
                    //This visual effect is applied to the target object not the location as above.  This visual effect
                    //represents the flame that erupts on the target not on the ground.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

                 }
             }
        }
       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, 20.0f, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }
    // Destroy all golems in  the island of the maker(and make the bodies stay)
    object oArea = GetArea(OBJECT_SELF);
    if(GetTag(oArea) != "IslandoftheMakerLowerRuins")
        oArea = GetObjectByTag("IslandoftheMakerLowerRuins");

    SignalEvent(oArea, EventUserDefined(103)); // kill of the golems at the lower level of the maker dungeon


    DestroyObject(OBJECT_SELF, 2.0);
}

void main()
{
    effect eVis = EffectVisualEffect(469);
    int i;
    float fDelay;
    // count down - the more the time advances - the more pulses would appear.
    for(i = 1; i <= 150; i++)
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF));
        fDelay += (1.0 - IntToFloat(i) / 30);
    }
    DelayCommand(14.0, Explode());

}
