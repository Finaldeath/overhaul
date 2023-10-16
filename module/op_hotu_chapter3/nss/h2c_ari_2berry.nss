//::///////////////////////////////////////////////
//:: Aribeth, PC Has 2 Velox Berries (Condition Script)
//:: H2c_Ari_2Berry.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has at least 2
     Velox Berries (based off of Brad Prince's
     Velox Berry scripts).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    // The number of berries we're looking for.
    int iNumBerries = 2;

    //Loop through the player's inventory, looking for berries.
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    int iStack = 0;
    int iBerryCount = 0;
    while(GetIsObjectValid(oItem))
    {
        //Increment the berry count
        if(GetTag(oItem) == "hx_fire_berries")
        {
            iStack = GetItemStackSize(oItem);
            iBerryCount = iBerryCount + iStack;
        }
        oItem = GetNextItemInInventory(oPC);
    }

    //Return TRUE if there are more berries that what we're looking for.
    if (iBerryCount >= iNumBerries)
    {
        return TRUE;
    }
    return FALSE;
}
