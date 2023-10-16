//::///////////////////////////////////////////////
//:: Check Good
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of good alignment
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}

