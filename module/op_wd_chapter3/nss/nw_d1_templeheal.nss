//::///////////////////////////////////////////////
//:: Temple Cast Heal
//:: NW_D1_TEMPLEHEAL.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Dialog speak force casts Heal on the person
*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    ActionCastSpellAtObject(SPELL_GREATER_RESTORATION, oPC, METAMAGIC_QUICKEN, TRUE);
    if(GetIsObjectValid(GetHenchman(oPC)))
    {
        object oTarget1 = GetHenchman(oPC);
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

        effect eBad = GetFirstEffect(oTarget1);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget1, eBad);
            }
            eBad = GetNextEffect(oTarget1);
        }
        if(GetRacialType(oTarget1) != RACIAL_TYPE_UNDEAD)
        {
            //Apply the VFX impact and effects
            int nHeal = GetMaxHitPoints(oTarget1) - GetCurrentHitPoints(oTarget1);
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget1);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget1, EventSpellCastAt(OBJECT_SELF, SPELL_GREATER_RESTORATION, FALSE));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget1);
        // checks to see if they have any healing potions; if not, creates it on them.
        if (!GetIsObjectValid(GetItemPossessedBy(oTarget1,"NW_IT_MPOTION003")))
        {
            CreateItemOnObject("NW_IT_MPOTION003",oTarget1,3);
        }
    }
    if(GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC)))
    {
        object oTarget2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

        effect eBad = GetFirstEffect(oTarget2);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget2, eBad);
            }
            eBad = GetNextEffect(oTarget2);
        }
        if(GetRacialType(oTarget2) != RACIAL_TYPE_UNDEAD)
        {
            //Apply the VFX impact and effects
            int nHeal = GetMaxHitPoints(oTarget2) - GetCurrentHitPoints(oTarget2);
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget2);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget2, EventSpellCastAt(OBJECT_SELF, SPELL_GREATER_RESTORATION, FALSE));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget2);
    }
    if(GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC)))
    {
        object oTarget3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

        effect eBad = GetFirstEffect(oTarget3);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget3, eBad);
            }
            eBad = GetNextEffect(oTarget3);
        }
        if(GetRacialType(oTarget3) != RACIAL_TYPE_UNDEAD)
        {
            //Apply the VFX impact and effects
            int nHeal = GetMaxHitPoints(oTarget3) - GetCurrentHitPoints(oTarget3);
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget3);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget3, EventSpellCastAt(OBJECT_SELF, SPELL_GREATER_RESTORATION, FALSE));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget3);
    }
    if(GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC)))
    {
        object oTarget4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

        effect eBad = GetFirstEffect(oTarget4);
        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
                GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
                GetEffectType(eBad) == EFFECT_TYPE_POISON ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oTarget4, eBad);
            }
            eBad = GetNextEffect(oTarget4);
        }
        if(GetRacialType(oTarget4) != RACIAL_TYPE_UNDEAD)
        {
            //Apply the VFX impact and effects
            int nHeal = GetMaxHitPoints(oTarget4) - GetCurrentHitPoints(oTarget4);
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget4);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget4, EventSpellCastAt(OBJECT_SELF, SPELL_GREATER_RESTORATION, FALSE));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget4);
    }
}
