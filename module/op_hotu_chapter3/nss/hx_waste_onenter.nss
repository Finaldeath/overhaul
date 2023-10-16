//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic on enter script for areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 28, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"


void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
           SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
           DoSinglePlayerAutoSave();
        }
    }

    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
