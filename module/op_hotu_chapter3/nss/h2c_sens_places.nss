//::///////////////////////////////////////////////
//:: Sensei Dharvana, Knower of Places Is Sleeping Man's True Love (Condition Script)
//:: H2c_Sens_Places.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower of Places is the
     Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Places")
    {
        return TRUE;
    }
    return FALSE;
}
