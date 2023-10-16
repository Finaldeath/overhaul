//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Thaddeus lost job.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oGelani = GetObjectByTag("q2_gelani");
    if (GetLocalInt(GetModule(), "OS_HELPGELANI")==99)
        return TRUE;
    return FALSE;
}
