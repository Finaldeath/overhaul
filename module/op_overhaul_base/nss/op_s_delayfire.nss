//::///////////////////////////////////////////////
//:: Delayed Blast Fireball
//:: op_s_delayfire.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 7
    Innate Level: 7
    School: Evocation
    Descriptor(s): Fire
    Component(s): Verbal, Somatic
    Range: Medium
    Area of Effect / Target: Huge
    Duration: 5 Rounds
    Additional Counter Spells:
    Save: Reflex 1/2
    Spell Resistance: Yes

    The caster creates a small, magical zone that can detect the passage of enemy creatures. When the field is activated,
    it explodes, doing 1d6 points of fire damage per caster level to all within the area of effect, to a maximum of 20d6.
    If no enemies enter it will explode after the chosen number of rounds.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DelayedBlastEffect();

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        oTarget = GetEnteringObject();

        if (DEBUG >= LOG_LEVEL_INFO) OP_Debug("[INFO] Delayed Fireball Blast. Entering object: " + GetName(oTarget));

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            DelayedBlastEffect();
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // Get count and increment until we reach the right number
        int nCount = GetLocalInt(OBJECT_SELF, "INCREMENT");
        nCount++;
        int nMaxCount;
        switch (nSpellId)
        {
            case SPELL_DELAYED_BLAST_FIREBALL_1_ROUND:  nMaxCount = 1; break;
            case SPELL_DELAYED_BLAST_FIREBALL_2_ROUNDS: nMaxCount = 2; break;
            case SPELL_DELAYED_BLAST_FIREBALL_3_ROUNDS: nMaxCount = 3; break;
            case SPELL_DELAYED_BLAST_FIREBALL_4_ROUNDS: nMaxCount = 4; break;
            case SPELL_DELAYED_BLAST_FIREBALL_5_ROUNDS: nMaxCount = 5; break;
        }

        if (nCount >= nMaxCount)
        {
            DelayedBlastEffect();
        }
        return;
    }

    // Default to the normal spell script.
    if (DoSpellHook()) return;

    // If fired at somewhere that has a enemy in the trigger already, we...just explode. I mean why not?
    float fRadius = StringToFloat(Get2DAString("vfx_persistent", "RADIUS", AOE_PER_DELAY_BLAST_FIREBALL));

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    while (GetIsObjectValid(oTarget))
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            DelayedBlastEffect();
            return;
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    }

    // Declare major variables including Area of Effect Object
    effect eAOE = EffectAreaOfEffect(AOE_PER_DELAY_BLAST_FIREBALL);

    // Duration depends on the subspell chosen, no Metamagic.
    float fDuration;

    switch (nSpellId)
    {
        case SPELL_DELAYED_BLAST_FIREBALL_1_ROUND:  fDuration = 6.0; break;
        case SPELL_DELAYED_BLAST_FIREBALL_2_ROUNDS: fDuration = 12.0; break;
        case SPELL_DELAYED_BLAST_FIREBALL_3_ROUNDS: fDuration = 18.0; break;
        case SPELL_DELAYED_BLAST_FIREBALL_4_ROUNDS: fDuration = 24.0; break;
        case SPELL_DELAYED_BLAST_FIREBALL_5_ROUNDS: fDuration = 30.0; break;
        default:
        {
            if (DEBUG >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] Delayed Blast Fireball: Invalid subspell selected.", LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    // Add 1.0 seconds so the last heartbeat fires properly.
    ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration + 1.0);
}

void DelayedBlastEffect()
{
    // Blow up on ourselves if the AOE!
    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // Just in case 2 events fire pretty much the same frame we check here.
        int bDoneBlast = GetLocalInt(OBJECT_SELF, "DONE_BLAST");
        if (bDoneBlast)
        {
            DestroyObject(OBJECT_SELF);
            return;
        }
        SetLocalInt(OBJECT_SELF, "DONE_BLAST", TRUE);

        lTarget = GetLocation(OBJECT_SELF);
    }

    // Max 20d6 damage
    int nDamageDice = min(nCasterLevel, 20);

    effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);

    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);

    //Cycle through the targets in the explosion area
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    while(GetIsObjectValid(oTarget))
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            // Fire cast spell at event for the specified target
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            float fDelay = GetRandomDelay(0.01, 0.1);

            // Make SR check
            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                int nDamage = GetDiceRoll(nDamageDice, 6);

                // Reflex adjusted
                nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, oCaster);

                if(nDamage > 0)
                {
                    // Apply VFX impact and damage effect
                    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                }
            }
        }
        // Get next target in the sequence
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }

}
