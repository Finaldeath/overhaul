// Shaori's Fell temple area user-defined events:
// 101: advance next stage of disease (or initiate it).

void AdvanceDisease(object oTarget);
void HandleItems(object oTarget);

// Creates an ability decrease effect for the current highest ability score.
effect PickHighestAbility(object oTarget, int nFactor);

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101) // next stage for disease
    {
        object oTarget = GetLocalObject(OBJECT_SELF, "DISEASE_TARGET");
        HandleItems(oTarget);
        DelayCommand(1.0, AdvanceDisease(oTarget));
    }
}

void CheckItem(object oPC, object oItem)
{
    itemproperty ipItem = GetFirstItemProperty(oItem);
    while(GetIsItemPropertyValid(ipItem))
    {
        if(GetItemPropertyType(ipItem) == ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS)
        {
            if(GetItemPropertySubType(ipItem) == IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN)
                AssignCommand(oPC, ActionUnequipItem(oItem));

        }
        ipItem = GetNextItemProperty(oItem);
    }

}

void HandleItems(object oTarget)
{
    object oItem;
    oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
    CheckItem(oTarget, oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oTarget);
    CheckItem(oTarget, oItem);
}

void AdvanceDisease(object oTarget)
{


    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    int nStage = GetLocalInt(oTarget, "Q6E_DISEASE_STAGE");
    int nFactor; // This factor would be used to determine all penalties
    if(nStage == 0)
        nFactor = 4;
    else
        nFactor = 2;

    // initial stage of the disease is 4 factors. Each stage later on is 1 factor
    SetLocalInt(oTarget, "Q6E_DISEASE_STAGE", nStage + 1);

    // Decreasing nFactor points point from each of the physical ability scores.
    // if one ability is already 3 or less, then decreasing from
    // the current highest ability.
    int nStr = GetAbilityScore(oTarget, ABILITY_STRENGTH);
    int nDex = GetAbilityScore(oTarget, ABILITY_DEXTERITY);
    int nCon = GetAbilityScore(oTarget, ABILITY_CONSTITUTION);
    int nInt = GetAbilityScore(oTarget, ABILITY_INTELLIGENCE);
    int nWis = GetAbilityScore(oTarget, ABILITY_WISDOM);
    int nCha = GetAbilityScore(oTarget, ABILITY_CHARISMA);

    effect eAbDec1;
    effect eAbDec2;
    effect eAbDec3;

    if(nStr - nFactor >= 3)
        eAbDec1 = EffectAbilityDecrease(ABILITY_STRENGTH, nFactor);
    else
        eAbDec1 = PickHighestAbility(oTarget, nFactor);
    if(nDex - nFactor >= 3)
        eAbDec2 = EffectAbilityDecrease(ABILITY_DEXTERITY, nFactor);
    else
        eAbDec2 = PickHighestAbility(oTarget, nFactor);
    if(nDex - nFactor >= 3)
        eAbDec3 = EffectAbilityDecrease(ABILITY_CONSTITUTION, nFactor);
    else
        eAbDec3 = PickHighestAbility(oTarget, nFactor);


    effect eSpellFailure = EffectSpellFailure((4 + nStage) * 5);
    effect eAttackDec = EffectAttackDecrease(4 + nStage * 2);
    effect eDamageDec = EffectDamageDecrease(4 + nStage);
    effect eACDec = EffectACDecrease(nFactor);
    effect eSaveDec = EffectSavingThrowDecrease(SAVING_THROW_TYPE_ALL, nFactor);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eAbDec1), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eAbDec2), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eAbDec3), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eSpellFailure), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eAttackDec), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eDamageDec), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eACDec), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eSpellFailure), oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eSaveDec), oTarget);
}

effect PickHighestAbility(object oTarget, int nFactor)
{
    int nInt = GetAbilityScore(oTarget, ABILITY_INTELLIGENCE);
    int nWis = GetAbilityScore(oTarget, ABILITY_WISDOM);
    int nCha = GetAbilityScore(oTarget, ABILITY_CHARISMA);

    effect eRet;

    if(nInt >= nWis && nInt >= nCha)
    {
        eRet = EffectAbilityDecrease(ABILITY_INTELLIGENCE, nFactor);
        return eRet;
    }
    if(nWis >= nInt && nWis >= nCha)
    {
        eRet = EffectAbilityDecrease(ABILITY_WISDOM, nFactor);
        return eRet;
    }
    eRet = EffectAbilityDecrease(ABILITY_CHARISMA, nFactor);
    return eRet;
}
