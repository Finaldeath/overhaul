//::///////////////////////////////////////////////
//:: Check for Pass
//:: 2q6_captain06
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC has the Diplomatic Pass
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M2Q06IAARINPASS");
    if(GetIsObjectValid(oItem))
    {
        return TRUE;
    }
    return FALSE;
    /*int iResult;
    iResult = GetLocalInt(GetModule(),"2Q6_HostTowerDoor") == 1;
    return iResult;*/
}
