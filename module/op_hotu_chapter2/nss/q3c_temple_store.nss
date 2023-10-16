//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Knowledge: Temple Store (Condition Script)
//:: Q3c_Temple_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has been told of
     the Temple Store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRumor = GetLocalInt(oPC, "Q3_Rumor_TempleStore");

    if (bRumor == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
