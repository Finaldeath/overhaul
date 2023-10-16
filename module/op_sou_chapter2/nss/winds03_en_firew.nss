//::///////////////////////////////////////////////
//:: Name winds03_en_firew
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Person within the AoE take 4d6 fire damage
    per round.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 6/03
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables

    int nDamage;
    effect eDam;
    object oTarget;
    //Declare and assign personal impact visual effect.
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    //Capture the first target object in the shape.
    oTarget = GetEnteringObject();

    //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_WALL_OF_FIRE));
        //Make SR check, and appropriate saving throw(s).
        if(!MyResistSpell(GetAreaOfEffectCreator(), oTarget))
        {
            //Roll damage.
            nDamage = d6(4);
            //****ADJUST THE DC HERE TO MAKE THE WALL OF FIRE TOUGHER - BASE is 14
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC()+ 10, SAVING_THROW_TYPE_FIRE);
            //*******************************************************
            if(nDamage > 0)
            {
                // Apply effects to the currently selected target.
                eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
        }

}

