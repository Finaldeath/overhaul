//::///////////////////////////////////////////////
//:: Flirt
//:: NW_D2_Flirtchlow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a Chr Low check and a gender check to
    see if the person is of the opposite sex
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: December 16, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nGender = GetGender(GetPCSpeaker());
    if(CheckCharismaLow())
    {
        if(nGender == 0)
        {
            if(GetGender(OBJECT_SELF) == 1)
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        else if (nGender == 1)
        {
            if(GetGender(OBJECT_SELF) == 0)
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        else
        {
            return FALSE;
        }
    }
    return FALSE;
}
