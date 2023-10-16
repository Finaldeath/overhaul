//::///////////////////////////////////////////////
//:: Name hx_inc_treasure
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Random treasure for creatures. Created on
     spawn-in.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

// Figure out whether to grab treasure of not.
void HX_GetTreasure(object oSelf = OBJECT_SELF);
// Get the treasure.
void GetTreasure(object oSelf);
// Count the treasure.
int GetTreasureCount(object oTreasure);

//////////////////////////////////////////////////

void HX_GetTreasure(object oSelf = OBJECT_SELF)
{
    int iRandom = Random(100);
    int iRandom2;

    if(iRandom <= 25)
    {
        // Random treasure.
        if(iRandom == 25)
        {
            GetTreasure(oSelf);
            GetTreasure(oSelf);
        }
        if(iRandom <= 15)
        {
            GetTreasure(oSelf);
        }
        // Random gold.
        else
        {
            iRandom = Random(1000) + 500;
            // Multiplier.
            iRandom2 = Random(5) + 1;

            GiveGoldToCreature(oSelf, iRandom * iRandom2);
        }
    }
}

// Get the treasure.
void GetTreasure(object oSelf)
{
    int iCount = 0;
    int x = 0;
    // How much treasure is left.
    object oTreasure = GetObjectByTag("hx_treasure");
    iCount = Random(GetTreasureCount(oTreasure));

    object oItem = GetFirstItemInInventory(oTreasure);

    while(x <= iCount)
    {
        if(x == iCount)
        {
            CopyItem(oItem, oSelf);
            return;
        }
        x = x + 1;
        oItem = GetNextItemInInventory(oTreasure);
    }
}

int GetTreasureCount(object oTreasure)
{
    int x = 0;
    object oItem = GetFirstItemInInventory(oTreasure);

    while(GetIsObjectValid(oItem))
    {
        x = x + 1;
        oItem = GetNextItemInInventory(oTreasure);
    }
    return x + 1;
}
