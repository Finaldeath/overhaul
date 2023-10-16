//::///////////////////////////////////////////////
//:: Name q5b_onenter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do a single player autosave and
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(oPC, "X1_WizDungeonAUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_WizDungeonAUTOSAVE", 1);
            DoSinglePlayerAutoSave();


        }

    }
}
