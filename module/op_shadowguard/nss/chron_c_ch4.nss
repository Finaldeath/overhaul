//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Chapter 4 Condition
//:: Chron_C_Ch4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has requested
     Chapter 4.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iChapter = GetLocalInt(oPC, "ChroniclesChapter");
    if (iChapter == 4)
    {
        return TRUE;
    }
    return FALSE;
}
