//::///////////////////////////////////////////////
//:: Grease: Heartbeat
//:: NW_S0_GreaseC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creatures entering the zone of grease must make
    a reflex save or fall down.  Those that make
    their save have their movement reduced by 1/2.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 1, 2001
//:://////////////////////////////////////////////
#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{


    //Declare major variables
    object oTarget;
    effect eFall = ExtraordinaryEffect(EffectKnockdown());
    float fDelay;
    //Get first target in spell area
    oTarget = GetFirstInPersistentObject();
    int nAppear;
    while(GetIsObjectValid(oTarget))
    {
            if(!spellsIsFlying(oTarget))
            {
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_INVALID, SPELL_GREASE));
                if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, 28, SAVING_THROW_TYPE_NONE, OBJECT_SELF, fDelay))
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFall, oTarget, 4.0);
                }
            }

        //Get next target in spell area
        oTarget = GetNextInPersistentObject();
    }
}

