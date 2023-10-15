void main()
{
    string sItemTemplate;
    object oPC = GetPCSpeaker();
    if(GetLocalInt(oPC,"NW_L_M1Q0Item2") == FALSE)
    {
        SetLocalInt(oPC,"NW_L_M1Q0Item2",TRUE);
        if(GetLevelByClass(CLASS_TYPE_DRUID,oPC) > 0)
        {
            sItemTemplate = "NW_IT_MRING024"; //boots of fortitude
        }
        else if(GetLevelByClass(CLASS_TYPE_ROGUE,oPC) > 0)
        {
            sItemTemplate = "nw_it_trap001"; //minor spike trap
        }
        else if(GetLevelByClass(CLASS_TYPE_BARBARIAN,oPC) > 0 ||
                GetLevelByClass(CLASS_TYPE_MONK,oPC) > 0 ||
                GetLevelByClass(CLASS_TYPE_RANGER,oPC) > 0)
        {
            sItemTemplate = "NW_IT_MBOOTS010"; //boots of reflex
        }
        else if(GetLevelByClass(CLASS_TYPE_CLERIC,oPC) > 0 ||
                GetLevelByClass(CLASS_TYPE_FIGHTER,oPC) > 0 ||
                GetLevelByClass(CLASS_TYPE_PALADIN,oPC) > 0)
        {
            sItemTemplate = "nw_aarcl004"; //chain mail
        }
        else
        {
            sItemTemplate = "NW_WMGMRD006"; //wand of Frost
        }
        object oItem = CreateItemOnObject(sItemTemplate,oPC);
        SetIdentified(oItem,TRUE);
        if(GetLevelByClass(CLASS_TYPE_ROGUE,oPC) > 0)
        {
            oItem = CreateItemOnObject(sItemTemplate,oPC);
            SetIdentified(oItem,TRUE);
        }
    }
}
