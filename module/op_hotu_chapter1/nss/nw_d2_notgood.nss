//::///////////////////////////////////////////////
//:: Check Evil or Neutral
//:: NW_D2_NOTGOOD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is not of good alignment
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetAlignmentGoodEvil(GetPCSpeaker()) != ALIGNMENT_GOOD)
    {
        return TRUE;
    }
    return FALSE;
}
