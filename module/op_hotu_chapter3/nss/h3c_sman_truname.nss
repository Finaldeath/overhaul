//::///////////////////////////////////////////////
//:: Sleeping Man, Knower of Names is One True Love (Condition Script)
//:: H3c_SMan_TruName.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower of Names is the Sleeping
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
    if (sLove ==  "Names")
    {
        return TRUE;
    }
    return FALSE;
}
