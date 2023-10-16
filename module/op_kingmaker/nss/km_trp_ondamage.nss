//:://////////////////////////////////////////////////
//:: km_trp_ondamage
/*
    OnDamaged event handler for trips
    extrodinary fear of death
 */
//:://////////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: june 2004
//:://////////////////////////////////////////////////

// Check to see if the target has any effects applied that may
// conflict with the fear effect for the henchman Trip
int ValidTargetCheck(object oTrip);

void main()
{
    object oSelf = OBJECT_SELF;
    int iMaxHP = GetMaxHitPoints(oSelf);
    int iCurHP = GetCurrentHitPoints(oSelf);
    float fHPRatio = IntToFloat(iCurHP) / IntToFloat(iMaxHP);

    // If trips HP is equalt to or less then ten percent of his max HP
    // he must make a save versus a mind effecting fear.
    if ((fHPRatio <= 0.1f) && (GetIsInCombat(oSelf)==TRUE))
    {
        effect eFear = EffectFrightened();
        effect evfx = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
        eFear = EffectLinkEffects(evfx, eFear);
        eFear= ExtraordinaryEffect(eFear);

        if (ValidTargetCheck(oSelf) == TRUE)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFear, oSelf, 10.0f);

            AssignCommand(oSelf, SpeakString("Eek! Flee, Trip! Flee to safety!"));
        }
    }

    ExecuteScript("nw_ch_ac6", OBJECT_SELF);
}

// Making sure trip should not be immune to fear
int ValidTargetCheck(object oTrip)
{
    effect eIterate = GetFirstEffect(oTrip);
    int iValidFlag = TRUE;

    // Cycle through all the effects on trip and check for any effects
    // that would prevent his fear in battle
    while (GetEffectType(eIterate) != EFFECT_TYPE_INVALIDEFFECT)
    {
        switch (GetEffectType(eIterate))
        {
            case EFFECT_TYPE_PETRIFY :
                iValidFlag = FALSE;
            break;

            case EFFECT_TYPE_DOMINATED :
                iValidFlag = FALSE;
            break;

            case EFFECT_TYPE_CHARMED :
                iValidFlag = FALSE;
            break;

            case EFFECT_TYPE_PARALYZE :
                iValidFlag = FALSE;
            break;

            case EFFECT_TYPE_SANCTUARY :
                iValidFlag = FALSE;
            break;

            case EFFECT_TYPE_SLEEP :
                iValidFlag = FALSE;
            break;
        }
        eIterate = GetNextEffect(oTrip);
    }

    return iValidFlag;
}
