//::///////////////////////////////////////////////
//:: General Treasure Spawn Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in general purpose treasure, usable
    by all classes.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   February 26 2001
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"

void main()

{
    if (GetLocalInt(OBJECT_SELF,"NW_DO_ONCE") != 0)
    {
       return;
    }
    object oLastOpener = GetLastOpener();
    SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",1);
    string sTres;
    if(GetLevelByClass(CLASS_TYPE_FIGHTER, oLastOpener) > 0 ||
       GetLevelByClass(CLASS_TYPE_RANGER, oLastOpener) > 0 ||
       GetLevelByClass(CLASS_TYPE_PALADIN, oLastOpener) > 0 ||
       GetLevelByClass(CLASS_TYPE_BARBARIAN, oLastOpener) > 0)
    {
        sTres = "nw_wswmls002";
    }
    else if(GetLevelByClass(CLASS_TYPE_ROGUE, oLastOpener) > 0 ||
            GetLevelByClass(CLASS_TYPE_BARD, oLastOpener) > 0)
    {
        sTres = "nw_wbwmsh002";
    }
    else if(GetLevelByClass(CLASS_TYPE_CLERIC, oLastOpener) > 0)
    {
        sTres = "nw_wblmml002";
    }
    else if(GetLevelByClass(CLASS_TYPE_DRUID, oLastOpener) > 0)
    {
        sTres = "nw_wswmsc002";
    }
    else if(GetLevelByClass(CLASS_TYPE_MONK, oLastOpener) > 0)
    {
        sTres = "nw_it_mglove026";
    }
    else // wizard, sorcerer
    {
        sTres = "nw_wmgwn004";
    }
    CreateItemOnObject(sTres);
}
