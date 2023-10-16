//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Deva: Persuaded (Condition Script)
//:: Q3c_Deva_Persuad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has Persuaded the
     deva to continue her mission.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 27, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bPersuade = GetLocalInt(OBJECT_SELF, "Q3_Deva_Persuaded");

    if (bPersuade == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
