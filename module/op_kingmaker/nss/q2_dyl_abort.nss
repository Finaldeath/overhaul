//::///////////////////////////////////////////////
//:: q2_dyl_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dylan's on-abort conversation script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

#include "os_include"

void main()
{
    if(os_CheckTalkedTo(1))
    {
        //object oDest = GetObjectByTag("q2aa_way_cutscene");
        object oWay = GetObjectByTag("q2_way_gatecopy");
        object oPC = GetFirstPC();
        //os_MoveParty(oDest, oPC);

        os_MoveParty(oWay, oPC);
        DelayCommand(1.1,ActionJumpToObject(oWay,FALSE));
    }
}
