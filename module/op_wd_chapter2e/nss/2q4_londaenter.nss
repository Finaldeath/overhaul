//::///////////////////////////////////////////////
//:: Set Encounter to Active
//:: 2q4_londaenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Londa enters the trigger make the encounter
    active.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: MArch 21, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oLonda = GetEnteringObject();
    int nPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if(GetTag(oLonda) == "2Q4A01_Londa" && nPlot >= 40)
    {
        SetEncounterActive(TRUE);
    }
}
