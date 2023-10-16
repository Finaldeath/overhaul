//::///////////////////////////////////////////////
//:: Name  con_q2crak_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return true if the PC is carrying the Genie bottle
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 21/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBottle = GetItemPossessedBy(oPC, "allDemonBottle");
    if (GetIsObjectValid(oBottle) == TRUE)
        return TRUE;
    return FALSE;
}
