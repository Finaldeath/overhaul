//::///////////////////////////////////////////////
//:: Name q5b_enter_area2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do a single player autosave and
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:May 1/03
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
            //To try and solve faction problem - make sure all kobolds hate the PC
            object oKobold = GetNearestObjectByTag("Q5_KOBOLD_ICE_HOUND", oPC);
            AdjustFactionReputation(oPC, oKobold, -100);
            object oHench = GetHenchman(oPC);
            if (GetIsObjectValid(oHench) == TRUE)
                AdjustFactionReputation(oHench, oKobold, -100);
        }

    }
}
