//::///////////////////////////////////////////////
//:: q1_open_chest1
//:: Weapon Spawn Script for Martial Classes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in a magical SPECIFIC item suited for that class.

*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    object oLastOpener = GetLastOpenedBy();
    object oContainer = OBJECT_SELF;

    if (GetLocalInt(OBJECT_SELF, "NW_L_OPENONCE") > 0 || GetIsObjectValid(oLastOpener) == FALSE)
    {
        return; // * abort treasure if no one opened the container
    }
    SetLocalInt(OBJECT_SELF, "NW_L_OPENONCE",1);


    // * Give an appropriate class-specific item
    if (GetLevelByClass(CLASS_TYPE_DRUID, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1druiditem", oContainer);
    }
    else if (GetLevelByClass(CLASS_TYPE_WIZARD, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1mageitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_SORCERER, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1sorcereritem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_PALADIN, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1paladinitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_BARBARIAN, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1barbitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_MONK, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1monkitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_CLERIC, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1clericitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_ROGUE, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1rogueitem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_RANGER, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1rangeritem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_FIGHTER, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1fighteritem", OBJECT_SELF);
    }
    else if (GetLevelByClass(CLASS_TYPE_BARD, oLastOpener) >= 1)
    {
        CreateItemOnObject("q1barditem", OBJECT_SELF);
    }
}


