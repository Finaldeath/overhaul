//::///////////////////////////////////////////////
//:: Condition: Dice Broadcast Mode == Private
//:: C_DiceBroad_P.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the PC is in Private Broadcast
    Mode (2).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iVolume = GetLocalInt(oPC, "DiceBagVolume");

    if (iVolume == 2)
    {
        return TRUE;
    }
    return FALSE;
}
