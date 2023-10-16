//::///////////////////////////////////////////////
//:: Enter Area
//:: M2Q5SETELTOORLAB
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets up the lab in Eltoora's tower.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////
#include "M2Q5ELTOORLAB"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_SetupEltoorLab") == 0)
    {
        SetupLab();
        SetLocalInt(GetModule(),"NW_G_SetupEltoorLab",1);
    }
}
