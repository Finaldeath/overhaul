//::///////////////////////////////////////////////
//:: Condition: Dice Broadcast Mode == Local
//:: C_DiceBroad_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the PC is in Local Broadcast
    Mode (0). This is the default mode.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iVolume = GetLocalInt(oPC, "DiceBagVolume");

    if (iVolume == 0)
    {
        return TRUE;
    }
    return FALSE;
}
