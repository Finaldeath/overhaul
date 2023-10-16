//::///////////////////////////////////////////////
//:: Witch's Wake 1: Module OnPlayerLevelUp
//:: WW1_OnPCLevelUp.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add any class-specific items.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: February 12, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCLevellingUp();

    //Tracking Tool for Rangers
    int iRanger = GetLevelByClass(CLASS_TYPE_RANGER, oPC);
    object oTracker = GetItemPossessedBy(oPC, "WW_Tracker");

    if (iRanger != 0 &&
        oTracker == OBJECT_INVALID)
    {
        CreateItemOnObject("trackertool", oPC);
    }
}
