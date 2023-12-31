//::///////////////////////////////////////////////
//:: con_prost8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a Chr Normal check and a gender check to
    see if the person is of the opposite sex
    and checks to see if the PC has insulted the prostitute
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

#include "inc_plot_locals"
int StartingConditional()
{
    if (ProstituteIsInsulted(GetTag(OBJECT_SELF), GetPCSpeaker()))
        return FALSE;
    int nGender = GetGender(GetPCSpeaker());
    if(CheckCharismaNormal())
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


