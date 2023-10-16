//::///////////////////////////////////////////////
//:: con_thad_sguildm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Thaddeus still has his job.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGelani = GetObjectByTag("q2_gelani");

    if (GetLocalInt(GetModule(), "OS_HELPGELANI") < 99)
        return TRUE;

    return FALSE;
}
