//::///////////////////////////////////////////////
//:: Check Neutral or Good
//:: NW_D2_NOTEVIL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is of good or neutral alignment
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetAlignmentGoodEvil(GetPCSpeaker()) != ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
