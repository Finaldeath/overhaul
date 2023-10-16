//:://////////////////////////////////////////////////
//:: X0_CH_HEN_SPAWN
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Henchman-specific OnSpawn handler for XP1. Based on NW_CH_AC9 by Bioware.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 10/09/2002
//:://////////////////////////////////////////////////

#include "x0_inc_henai"

void ApplyPower(int nSlotSpell)
{
    object oItem = GetItemPossessedBy(OBJECT_SELF, "q4_GolemHide");
    itemproperty ipBonus;
    if(nSlotSpell == SPELL_GREATER_SPELL_MANTLE)
        ipBonus = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_32);
    else if(nSlotSpell == SPELL_BIGBYS_CRUSHING_HAND)
        ipBonus = ItemPropertyAbilityBonus(IP_CONST_ABILITY_STR, 4);
    else if(nSlotSpell == SPELL_ETHEREALNESS)
        ipBonus = ItemPropertyACBonus(4);
    else if(nSlotSpell == SPELL_TIME_STOP)
        ipBonus = ItemPropertyRegeneration(8);
    else if(nSlotSpell == SPELL_PREMONITION)
        ipBonus = ItemPropertyDamageReduction(IP_CONST_DAMAGEREDUCTION_5, IP_CONST_DAMAGESOAK_30_HP);
    else if(nSlotSpell == SPELL_MASS_HASTE)
        ipBonus = ItemPropertyHaste();
    else if(nSlotSpell == SPELL_TRUE_SEEING)
        ipBonus = ItemPropertyTrueSeeing();
    else if(nSlotSpell == SPELL_CHAIN_LIGHTNING)
    {
        ipBonus = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_CHAIN_LIGHTNING, 3);
        oItem = GetItemPossessedBy(OBJECT_SELF, "q4_GolemArmor");
    }
    else if(nSlotSpell == SPELL_MORDENKAINENS_DISJUNCTION)
    {
        ipBonus = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_GREATER_DISPELLING, 20);
        oItem = GetItemPossessedBy(OBJECT_SELF, "q4_GolemSlam");
    }

    AddItemProperty(DURATION_TYPE_PERMANENT, ipBonus, oItem);


}

void main()
{
    //Sets up the special henchmen listening patterns
    SetAssociateListenPatterns();

    // Set additional henchman listening patterns
    bkSetListeningPatterns();

    // Default behavior for henchmen at start
    SetAssociateState(NW_ASC_POWER_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_50);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);

    // * July 2003. Set this to true so henchmen
    // * will hopefully run off a little less often
    // * by default
    SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, TRUE);
    SetAssociateState(NW_ASC_DISTANCE_2_METERS);

    //Use melee weapons by default
    SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE);

    // Set starting location
    SetAssociateStartLocation();

    // Set respawn location
    SetRespawnLocation();

    // For some general behavior while we don't have a master,
    // let's do some immobile animations
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);

    // Apply all extra powers

    int nSlot0 = GetLocalInt(GetModule(), "Q4D_GOLEM_SLOT" + IntToString(0));
    int nSlot1 = GetLocalInt(GetModule(), "Q4D_GOLEM_SLOT" + IntToString(1));
    int nSlot2 = GetLocalInt(GetModule(), "Q4D_GOLEM_SLOT" + IntToString(2));
    int nSlot3 = GetLocalInt(GetModule(), "Q4D_GOLEM_SLOT" + IntToString(3));

    ApplyPower(nSlot0);
    ApplyPower(nSlot1);
    ApplyPower(nSlot2);
    ApplyPower(nSlot3);

    object oMaster = GetMaster(OBJECT_SELF);
    if(oMaster == OBJECT_INVALID)
        oMaster = GetLocalObject(OBJECT_SELF, "MASTER");
    if(oMaster == OBJECT_INVALID)
        oMaster = GetFirstPC();

    effect eACBonus = EffectACIncrease(2, AC_DODGE_BONUS);
    effect eSTBonus = EffectSavingThrowIncrease(SAVING_THROW_ALL, 2);
    effect eLink = EffectLinkEffects(eACBonus, eSTBonus);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oMaster);

    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);
    SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);
    SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);
    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);

    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "x2ai_guardian");
    SetIsDestroyable(FALSE, FALSE, FALSE);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_DISABLEEQUIP", 1); // so the player won't equip items on him.

}
