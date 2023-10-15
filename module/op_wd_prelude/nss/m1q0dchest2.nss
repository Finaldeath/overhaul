void GiveItem(string sTemplate);

void main()
{
    string sItemTemplate1;
    string sItemTemplate2;
    string sItemTemplate3;
    string sItemTemplate4;
    object oPC = GetLastOpenedBy();
    if(GetIsObjectValid(oPC) == FALSE)
    {
        oPC = GetLastAttacker();
    }
    if(GetLocalInt(oPC,"NW_L_M1Q0Item4") == FALSE)
    {
        SetLocalInt(oPC,"NW_L_M1Q0Item4",TRUE);
        if(GetLevelByClass(CLASS_TYPE_CLERIC,oPC) > 0 ||
           GetLevelByClass(CLASS_TYPE_FIGHTER,oPC) > 0 ||
           GetLevelByClass(CLASS_TYPE_PALADIN,oPC) > 0)
        {
            sItemTemplate1 = "NW_AARCL005"; //Splintmail
        }
        else if(GetLevelByClass(CLASS_TYPE_BARBARIAN,oPC) > 0)
        {
            sItemTemplate1 = "NW_IT_MBELT010"; //Brawler's belt
        }
        else if(GetLevelByClass(CLASS_TYPE_DRUID,oPC) > 0)
        {
            sItemTemplate1 = "NW_AARCL010"; //Breastplate
        }
        else if(GetLevelByClass(CLASS_TYPE_MONK,oPC) > 0)
        {
            sItemTemplate1 = "NW_IT_MNECK024"; //Amulet of will
        }
        else if(GetLevelByClass(CLASS_TYPE_RANGER,oPC) > 0)
        {
            sItemTemplate1 = "NW_MAARCL097"; //Cloak of prot vs. evil
        }
        else if(GetLevelByClass(CLASS_TYPE_ROGUE,oPC) > 0)
        {
            sItemTemplate1 = "NW_IT_TRAP002"; // average spike trap
            sItemTemplate2 = "NW_IT_TRAP029"; // minor cold trap
            sItemTemplate3 = "NW_IT_TRAP029"; // minor cold trap
        }
        else
        {
            sItemTemplate1 = "NW_IT_SPARSCR108"; //Sleep scoll
            sItemTemplate2 = "NW_IT_SPARSCR104"; //Mage Armor
            sItemTemplate3 = "NW_IT_SPARSCR110"; //Color spray
            sItemTemplate4 = "NW_IT_SPARSCR105"; //Summon creature 1
        }
        GiveItem(sItemTemplate1);
        GiveItem(sItemTemplate2);
        GiveItem(sItemTemplate3);
        GiveItem(sItemTemplate4);
    }
}

void GiveItem(string sTemplate)
{
    object oItem = CreateItemOnObject(sTemplate);
    SetIdentified(oItem,TRUE);
    return;
}
