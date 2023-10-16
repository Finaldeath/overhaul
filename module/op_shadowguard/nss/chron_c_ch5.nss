//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Chapter 5 Condition
//:: Chron_C_Ch5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has requested
     Chapter 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iChapter = GetLocalInt(oPC, "ChroniclesChapter");
    if (iChapter == 5)
    {
        return TRUE;
    }
    return FALSE;
}
