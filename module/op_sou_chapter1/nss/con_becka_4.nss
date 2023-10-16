//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     check if PC is back, but job not done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 5, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_BECKASPEAK")==10)
        return TRUE;
    return FALSE;
}