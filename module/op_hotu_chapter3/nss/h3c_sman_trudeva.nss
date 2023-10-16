//::///////////////////////////////////////////////
//:: Sleeping Man, Deva is One True Love (Condition Script)
//:: H3c_SMan_TruDeva.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Lavoera the Deva is the Sleeping
     Man's one true love and the player knows her
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove ==  "Lavoera")
    {
        return TRUE;
    }
    return FALSE;
}
