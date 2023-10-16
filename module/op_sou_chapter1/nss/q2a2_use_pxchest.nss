//::///////////////////////////////////////////////
//:: Name q2a2_use_pxchest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC opens this chest - if they have not
    received their ring and focus crystal - they
    will get one of each
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetLocalInt(oPC, "nPCNumber") != 1)
    {
        if (GetLocalInt(oPC, "X1_nQ2A2GotRing") != 1)
        {
            SetLocalInt(oPC, "X1_nQ2A2GotRing", 1);
            object oRing = GetItemPossessedBy(oPC, "xp1_mystrashand");
            if (oRing == OBJECT_INVALID)
            {
                object oCrystal = GetItemPossessedBy(oPC, "focuscrystal");
                if (oCrystal == OBJECT_INVALID)
                {
                    CreateItemOnObject("xp1_mystrashand");
                    CreateItemOnObject("focuscrystal");
                    CreateItemOnObject("focuscrystal");
                    CreateItemOnObject("journal");
                    // * Give an appropriate class-specific item
                    if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1)
                    {
                        CreateItemOnObject("q1druiditem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_WIZARD, oPC) >= 1)
                    {
                        CreateItemOnObject("q1mageitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_SORCERER, oPC) >= 1)
                    {
                        CreateItemOnObject("q1sorcereritem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >= 1)
                    {
                        CreateItemOnObject("q1paladinitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC) >= 1)
                    {
                        CreateItemOnObject("q1barbitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_MONK, oPC) >= 1)
                    {
                        CreateItemOnObject("q1monkitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) >= 1)
                    {
                        CreateItemOnObject("q1clericitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= 1)
                    {
                        CreateItemOnObject("q1rogueitem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 1)
                    {
                        CreateItemOnObject("q1rangeritem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) >= 1)
                    {
                        CreateItemOnObject("q1fighteritem");
                    }
                    else if (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 1)
                    {
                        CreateItemOnObject("q1barditem");
                    }
                }
            }
        }
    }
}
