//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Blake doesn't have baby, plot is over
     and Nora doesn't know Blake is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 3, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_NORAHASBABY") != 1
        &&GetLocalInt(GetPCSpeaker(),"X1_NORAWIDOW") != 1)
        return TRUE;
    return FALSE;
}
