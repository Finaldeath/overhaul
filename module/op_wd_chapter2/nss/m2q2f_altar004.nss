//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2f_Altar004
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Teleport the PC to the Realm of the Spirit.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPlayer = GetPCSpeaker();
    object oDagger = GetItemPossessedBy(oPlayer,"M2Q2_NymphDagger");
    effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);
    int bValid;


    if (GetIsObjectValid(oDagger))
    {
        DestroyObject(oDagger);
    }

    SetLocalInt(OBJECT_SELF,"NW_L_DaggerReturned",1);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

    effect eBad = GetFirstEffect(oPlayer);
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
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
            {
                //Remove effect if it is negative.
                RemoveEffect(oPlayer, eBad);
            }
        eBad = GetNextEffect(oPlayer);
    }
    //Fire cast spell at event for the specified target
    SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
    string sDestTag = "WP_M2Q2GtoM2Q2F";
    object oSpawnPoint = GetObjectByTag(sDestTag);
    AssignCommand(oPlayer,JumpToLocation(GetLocation(oSpawnPoint)));
}
