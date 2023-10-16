//::///////////////////////////////////////////////
//:: Sleeping Man, Lie: Sensei is One True Love (Condition Script)
//:: H3c_SMan_LieSens.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sensei is not the Sleeping
     Man's one true love and the player knows her
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "sKnower_SenseiNamed");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (bName == TRUE &&
        sLove !=  "Sensei")
    {
        return TRUE;
    }
    return FALSE;
}

