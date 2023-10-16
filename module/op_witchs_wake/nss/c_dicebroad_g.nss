//::///////////////////////////////////////////////
//:: Condition: Dice Broadcast Mode == Global
//:: C_DiceBroad_G.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the PC is in Global Broadcast
    Mode (1).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iVolume = GetLocalInt(oPC, "DiceBagVolume");

    if (iVolume == 1)
    {
        return TRUE;
    }
    return FALSE;
}
