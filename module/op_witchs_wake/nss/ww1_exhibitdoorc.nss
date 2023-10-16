//::///////////////////////////////////////////////
//:: Witchwork 1: Guild Exhibit Door, Condition
//:: WW1_ExhbitDoorC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has received
     permission from Helga (picking the lock is
     another viable path in).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetEnteringObject();
    int bAccess = GetLocalInt(oPC, "CONV_HELGA_Access");

    if (bAccess == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
