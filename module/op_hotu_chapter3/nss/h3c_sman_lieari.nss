//::///////////////////////////////////////////////
//:: Sleeping Man, Lied to About Aribeth Being One True Love (Condition Script)
//:: H3c_SMan_LieAri.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is not the Sleeping
     Man's one true love and the player knows her
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "sKnower_AribethNamed");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (bName == TRUE &&
        sLove !=  "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}

