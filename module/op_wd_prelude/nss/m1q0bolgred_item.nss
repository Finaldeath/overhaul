void main()
{
    string sItemTemplate;
    object oPC = GetPCSpeaker();
    if(GetLocalInt(oPC,"NW_L_M1Q0Item1") == FALSE)
    {
        SetLocalInt(oPC,"NW_L_M1Q0Item1",TRUE);
        if(GetLevelByClass(CLASS_TYPE_BARD,oPC) > 0 ||
           GetLevelByClass(CLASS_TYPE_DRUID,oPC) > 0 ||
           GetLevelByClass(CLASS_TYPE_ROGUE,oPC) > 0)
        {
            sItemTemplate = "nw_aarcl002"; //studded leather
        }
        else if(GetLevelByClass(CLASS_TYPE_SORCERER,oPC) > 0 ||
                GetLevelByClass(CLASS_TYPE_WIZARD,oPC) > 0)
        {
            sItemTemplate = "nw_mcloth009"; //ropbe of fire resistance
        }
        else if(GetLevelByClass(CLASS_TYPE_MONK,oPC) > 0)
        {
            sItemTemplate = "nw_mcloth018"; //robe of the shining hand +1
        }
        else
        {
            sItemTemplate = "nw_aarcl012"; //chainshirt
        }
        object oItem = CreateItemOnObject(sItemTemplate,oPC);
        SetIdentified(oItem,TRUE);
    }
}
