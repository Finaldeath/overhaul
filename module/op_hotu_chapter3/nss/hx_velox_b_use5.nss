//::///////////////////////////////////////////////
//:: Name hx_velox_b_use3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will note that the player has made a camp
     with 3 berries.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

void main()
{
    // Just change this variable for each script.
    int iScript = 5;

    object oPC = GetPCSpeaker();

    location lLoc = GetLocation(OBJECT_SELF);

    object oItem = GetFirstItemInInventory(oPC);
    int iStack = 0;

    // Give them a potion.
    CreateItemOnObject("hx_berry_potion", oPC, 1);

    // Take the berries.
    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == "hx_fire_berries")
        {
            iStack = GetItemStackSize(oItem);
            if(iScript >= iStack)
            {
                DestroyObject(oItem);
                iScript = iScript - iStack;
                if(iScript <= 0)
                {
                    return;
                }
            }
            else
            {
                SetItemStackSize(oItem, iStack - iScript);
                return;
            }
        }
        oItem = GetNextItemInInventory(oPC);
    }
}
