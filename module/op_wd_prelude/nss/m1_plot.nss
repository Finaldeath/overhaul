void DestroyUndead(object oArea)
{
    if(GetIsObjectValid(oArea))
    {
        object oUndead = GetFirstObjectInArea(oArea);
        while(GetIsObjectValid(oUndead))
        {
            if(GetRacialType(oUndead) == RACIAL_TYPE_UNDEAD)
            {
                DestroyObject(oUndead);

            }
            oUndead = GetNextObjectInArea(oArea);
        }
    }
}

int PCsInArea(object oArea = OBJECT_SELF)
{
    int bFound;
    object oCreature = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oCreature) && bFound == FALSE)
    {
        if(GetIsPC(oCreature))
        {
            bFound = TRUE;
        }
        oCreature = GetNextObjectInArea(oArea);
    }
    return bFound;
}

void HealEveryone(object oArea = OBJECT_SELF)
{
    object oCreature = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oCreature))
    {
        if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE &&
           GetIsPC(oCreature) == FALSE)
        {
            AssignCommand(oCreature, ClearAllActions());
            AssignCommand(oCreature, ActionCastSpellAtObject(SPELL_GREATER_RESTORATION,
                                                             oCreature,
                                                             METAMAGIC_ANY,
                                                             TRUE,
                                                             0,
                                                             PROJECTILE_PATH_TYPE_DEFAULT,
                                                             TRUE));
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}

void AutoSave(object oPC)
{
    if(GetLocalInt(GetModule(),"NW_G_" + GetTag(OBJECT_SELF) + "_AUTOSAVE") == FALSE &&
       GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_" + GetTag(OBJECT_SELF) + "_AUTOSAVE",TRUE);
    }
}

void GiveChange(object oTarget, int nChange)
{
    CreateItemOnObject("M1Q04ISMUGCOIN",oTarget,nChange);
}

void PurchaseAuctionItem(string sTemplate,int nCost)
{
    int nCount;
    object oCoin = GetFirstItemInInventory(GetPCSpeaker());
    while(GetIsObjectValid(oCoin) && nCount < nCost)
    {
        if(GetTag(oCoin) == "M1Q04ISMUGCOIN")
        {
            nCount = nCount + GetNumStackedItems(oCoin);
            DestroyObject(oCoin);
        }
        oCoin = GetNextItemInInventory(GetPCSpeaker());
    }
    if(nCount > nCost)
    {
       DelayCommand(0.1,GiveChange(GetPCSpeaker(),nCount - nCost));
    }
    CreateItemOnObject(sTemplate,GetPCSpeaker());
}

void FleeArea(string sTarget = "WP_FLEE",int bRun = TRUE,object oTarget = OBJECT_SELF)
{
    ClearAllActions();
    ActionForceMoveToObject(GetNearestObjectByTag(sTarget),bRun);
    ActionDoCommand(DestroyObject(oTarget));
    SetCommandable(FALSE);
}

void RestoreEveryone()
{
    object oTarget = GetFirstPC();
    while(GetIsObjectValid(oTarget))
    {
        effect eBad = GetFirstEffect(oTarget);
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
                RemoveEffect(oTarget, eBad);
            }
            eBad = GetNextEffect(oTarget);
        }
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        if(nHeal > 0)
        {
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        }
        oTarget = GetNextPC();
    }
}
