//::///////////////////////////////////////////////
//:: Flirt
//:: NW_D2_FlirtNO
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks: Is Charisma Low OR
            Is Gender the same
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") == 3)
    {
        if(GetGender(GetPCSpeaker()) == GetGender(OBJECT_SELF))
        {
            if(CheckCharismaLow())
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}
