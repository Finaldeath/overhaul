//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC told Ellysia about Feran.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oEllysia = GetObjectByTag("q2_ellysia");
    if (GetLocalInt(GetModule(), "OS_FERANLOVE")>0)
        return TRUE;
    return FALSE;
}
