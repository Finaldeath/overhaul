//::///////////////////////////////////////////////
//:: Flirt
//:: NW_D2_Flirtx     (Ugly flirt)
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a Chr Low check and a gender check to
    see if the person is of the opposite sex
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: Oct 31, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nGender = GetGender(GetPCSpeaker());
    if(CheckCharismaLow(GetPCSpeaker()))
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

