//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC working for Thaddeus.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oThad = GetObjectByTag("q2_thaddeus");
    if (GetLocalInt(GetModule(), "OS_KILLGELANI")==10)
        return TRUE;
    return FALSE;
}
