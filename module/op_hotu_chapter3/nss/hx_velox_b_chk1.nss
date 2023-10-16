//::///////////////////////////////////////////////
//:: Name hx_velox_b_chk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will note that the player has at least
     1 berry.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    // Just change this variable for each script.
    int iScript = 1;

    object oPC = GetPCSpeaker();

    object oItem = GetFirstItemInInventory(oPC);
    int iStack = 0;
    int x = 0;

    // Set a variable on the PC so we know what to do if they abort the dialogue.
    SetLocalInt(oPC, "HX_PC_STARTED_FIRE", 1);

    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == "hx_fire_berries")
        {
            iStack = GetItemStackSize(oItem);
            x = x + iStack;
        }
        oItem = GetNextItemInInventory(oPC);
    }

    if(x >= iScript)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
