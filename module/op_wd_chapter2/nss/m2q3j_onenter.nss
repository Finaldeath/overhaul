//::///////////////////////////////////////////////
//:: m2q3J On Enter Script
//:: m2q3J_OnEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Part of the Wizard Lab template, this script
    triggers the Lab's setup.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

#include "m2q3J_Lab"

void main()
{
    if(GetLocalInt(GetModule(), "NW_SETUPLABM2Q3J") == 0)
    {
        SetupLab();
        SetLocalInt(GetModule(), "NW_SETUPLABM2Q3J", 1);
    }
    if(GetLocalInt(GetModule(),"NW_G_M2Q3J_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q3J_AUTOSAVE",1);
    }
}
