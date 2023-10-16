//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Chapter 3 Condition
//:: Chron_C_Ch3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has requested
     Chapter 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iChapter = GetLocalInt(oPC, "ChroniclesChapter");
    if (iChapter == 3)
    {
        return TRUE;
    }
    return FALSE;
}
