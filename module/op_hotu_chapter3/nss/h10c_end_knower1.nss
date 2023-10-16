//::///////////////////////////////////////////////
//:: End Narration, Knowers Love Triangle (Condition Script)
//:: H10c_End_Knower1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knowers have a love
     triangle with the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sFate == "Places" ||
        sFate == "Names")
    {
        return TRUE;
    }
    return FALSE;
}
