//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Deva: Persuade Once (Condition Script)
//:: Q3c_Deva_Persuad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not already
     attempted the Deva's Persuade check.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "Q3_Deva_PersuadeOnce");
    if (bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Q3_Deva_PersuadeOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
