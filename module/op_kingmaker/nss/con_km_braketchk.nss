//::///////////////////////////////////////////////
//:: Check the state of a bracket
//:: con_km_braketchk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make sure a bracket is able to support a mirror
    placable
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oInventory = GetItemPossessedBy(GetPCSpeaker(), "pzl_mobilemirror");
    int iUsable = GetLocalInt(OBJECT_SELF, "USABLE");

    if((iUsable == TRUE)&&(oInventory != OBJECT_INVALID))
    {
        iResult = GetLocalInt(OBJECT_SELF, "USABLE");
    }

    return iResult;
}
