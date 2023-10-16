//::///////////////////////////////////////////////
//:: Sleeping Man, Lie: Knower of Places is One True Love (Condition Script)
//:: H3c_SMan_LiePlac.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower of Places is not the Sleeping
     Man's one true love and the player knows her
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "sKnower_PlacesNamed");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (bName == TRUE &&
        sLove !=  "Places")
    {
        return TRUE;
    }
    return FALSE;
}
