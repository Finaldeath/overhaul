// Using the magic-item creation machine:
// check the left and right urns to see if they have the right components, and if so - create the item
// in the player's inventory.

void DestroyInventory(object oObject)
{
    object oItem = GetFirstItemInInventory(oObject);
    while(oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oObject);
    }

}

void main()
{
    effect eUrn = EffectVisualEffect(VFX_IMP_MAGBLUE);
    object oRightUrn = GetNearestObjectByTag("Q3B_RIGHT_URN");
    object oLeftUrn = GetNearestObjectByTag("Q3B_LEFT_URN");

    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eUrn, oRightUrn));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eUrn, oLeftUrn));

    int nLeftRubyCount = GetLocalInt(oLeftUrn, "RUBY_COUNT");
    int nLeftBelladonaCount = GetLocalInt(oLeftUrn, "BELLADONA_COUNT");
    int nLeftDragonCount = GetLocalInt(oLeftUrn, "DRAGON_COUNT");
    int nLeftSlaadiCount = GetLocalInt(oLeftUrn, "SLAADI_COUNT");
    int nLeftFairyCount = GetLocalInt(oLeftUrn, "FAIRY_COUNT");

    int nRightRubyCount = GetLocalInt(oRightUrn, "RUBY_COUNT");
    int nRightBelladonaCount = GetLocalInt(oRightUrn, "BELLADONA_COUNT");
    int nRightDragonCount = GetLocalInt(oRightUrn, "DRAGON_COUNT");
    int nRightSlaadiCount = GetLocalInt(oRightUrn, "SLAADI_COUNT");
    int nRightFairyCount = GetLocalInt(oRightUrn, "FAIRY_COUNT");

    int nLeftUrnIsValid = 0; // whether the left urn has valid components
    int nRightUrnIsValid = 0; // whether the right urn has valid components

    // for each valid power - setting the var that would be used in the item script
    // Q3B_POWERSTONE_OFF - offensive power
    if(nLeftRubyCount == 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 1);
        nLeftUrnIsValid = 1;
    }
    else if(nLeftRubyCount == 3)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 2);
        nLeftUrnIsValid = 1;
    }
    else if(nLeftBelladonaCount >= 4)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 3);
        nLeftUrnIsValid = 1;
    }
    else if(nLeftDragonCount >= 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 4);
        nLeftUrnIsValid = 1;
    }
    else if(nLeftSlaadiCount >= 10)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 5);
        nLeftUrnIsValid = 1;
    }
    else if(nLeftFairyCount >= 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_OFF", 6);
        nLeftUrnIsValid = 1;
    }

    // setting the defensive powers
    if(nRightRubyCount == 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 1);
        nRightUrnIsValid = 1;
    }
    else if(nRightRubyCount == 3)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 2);
        nRightUrnIsValid = 1;
    }
    else if(nRightBelladonaCount >= 6)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 3);
        nRightUrnIsValid = 1;
    }
    else if(nRightDragonCount >= 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 4);
        nRightUrnIsValid = 1;
    }
    else if(nRightSlaadiCount >= 6)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 5);
        nRightUrnIsValid = 1;
    }
    else if(nRightFairyCount >= 1)
    {
        SetCampaignInt("dbItems", "Q3B_POWERSTONE_DEF", 6);
        nRightUrnIsValid = 1;
    }

    if(nRightUrnIsValid && nLeftUrnIsValid)
    {
        // create the power stone
        effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eBoom, OBJECT_SELF);
        effect eDam = EffectDamage(1000);
        SetPlotFlag(OBJECT_SELF, FALSE);
        SetPlotFlag(oLeftUrn, FALSE);
        SetPlotFlag(oRightUrn, FALSE);
        object oSparks = GetNearestObjectByTag("Q3B_SPARKS");
        SetPlotFlag(oSparks, FALSE);
        DestroyObject(oSparks);
        CreateObject(OBJECT_TYPE_ITEM, "x0_powerstone", GetLocation(OBJECT_SELF));
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF));
        DestroyInventory(oLeftUrn);
        DestroyInventory(oRightUrn);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oLeftUrn);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oRightUrn);
        int n = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        effect eKnock = EffectKnockdown();
        while (oCreature != OBJECT_INVALID)
        {
            int nRand = d6(1);
            eDam = EffectDamage(nRand, DAMAGE_TYPE_SONIC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oCreature);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oCreature, 2.0);
            n++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        }
        DelayCommand(1.0, FloatingTextStrRefOnCreature(40513, GetLastUsedBy()));
        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            GiveXPToCreature(oPC, 300);
            oPC = GetNextPC();
        }
    }
    else // not enough components
    {
        DelayCommand(1.0, FloatingTextStrRefOnCreature(40514, GetLastUsedBy()));
    }
}
