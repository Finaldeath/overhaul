// This script creates a treasure item based on the class of the
//PC who killed this creature
void main()
{
    string sItemTemplate;
    object oPC = GetLastKiller();
    object oMaster = GetMaster(oPC);
    if(GetIsObjectValid(oMaster))
    {
        oPC = oMaster;
    }
    if(GetLevelByClass(CLASS_TYPE_SORCERER,oPC) > 0 ||
       GetLevelByClass(CLASS_TYPE_WIZARD,oPC) > 0 )
    {
        sItemTemplate = "nw_wmgwn012"; //Wand of Sleep
    }
    else if(GetLevelByClass(CLASS_TYPE_BARBARIAN,oPC) > 0)
    {
        sItemTemplate = "NW_ASHMSW011"; //Shield of the Watch
    }
    else if(GetLevelByClass(CLASS_TYPE_BARD,oPC) > 0)
    {
        sItemTemplate = "NW_IT_MGLOVE005"; //Gloves of the Minstril
    }
    else if(GetLevelByClass(CLASS_TYPE_DRUID,oPC) > 0)
    {
        sItemTemplate = "NW_ASHMSW010"; //Shield of Dawn
    }
    else if(GetLevelByClass(CLASS_TYPE_MONK,oPC) > 0)
    {
        sItemTemplate = "nw_it_mboots018"; //Boots of the sun soul
    }
    else if(GetLevelByClass(CLASS_TYPE_RANGER,oPC) > 0)
    {
        sItemTemplate = "NW_IT_MBELT011"; //Archer's Belt
    }
    else if(GetLevelByClass(CLASS_TYPE_ROGUE,oPC) > 0)
    {
        sItemTemplate = "nw_it_mglove009"; //Gloves of Swordplay
    }
    else
    {
        sItemTemplate = "NW_AARCL006"; //HalfPlate
    }
    object oItem = CreateItemOnObject(sItemTemplate);
    SetIdentified(oItem,TRUE);
}
