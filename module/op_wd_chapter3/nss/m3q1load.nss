//::///////////////////////////////////////////////
//:: Load Module
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets up locals the first time the module is ran.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  November 17, 2001
//:://////////////////////////////////////////////

#include "M3Q1Lab"

void main()
{
    if (GetLocalInt(GetModule(),"NW_SETUPLAB3Q1A09") == 0)
    {
        SetupLab();
        SetLocalInt(GetModule(),"NW_SETUPLAB3Q1A09",1);
    }
}
