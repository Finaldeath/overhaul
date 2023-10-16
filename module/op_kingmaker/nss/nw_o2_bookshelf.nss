//::///////////////////////////////////////////////
//:: Library treasure script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in scroll potion or wand treasure
    ** override script to prevent FR books from
    showing in the game.
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith K2 Hayward
//:: Created On:   October 15 2004
//:://////////////////////////////////////////////

#include "x0_i0_treasure"

void main()
{
    int iRand = Random(4);

    if (iRand = 0)
    {
        CTG_CreateSpecificBaseTypeTreasure(TREASURE_TYPE_LOW, GetLastOpener(), OBJECT_SELF, BASE_ITEM_POTIONS);
    }
    else if (iRand = 1)
    {
        CTG_CreateSpecificBaseTypeTreasure(TREASURE_TYPE_LOW, GetLastOpener(), OBJECT_SELF, BASE_ITEM_MAGICWAND);
    }
    else if (iRand = 2)
    {
        CTG_CreateSpecificBaseTypeTreasure(TREASURE_TYPE_LOW, GetLastOpener(), OBJECT_SELF, BASE_ITEM_SCROLL);
    }
    else
    {
        CTG_CreateSpecificBaseTypeTreasure(TREASURE_TYPE_MED, GetLastOpener(), OBJECT_SELF, BASE_ITEM_SCROLL);
    }
}


