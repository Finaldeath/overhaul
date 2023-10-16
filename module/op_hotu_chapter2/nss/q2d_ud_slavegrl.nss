//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d_ud_slavegrl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mindflayers will cause all in the area to
    go hostile to the PC when attacked, etc..
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1005 || nUser == NW_FLAG_SPELL_CAST_AT_EVENT) // ATTACKED // EVENT_SPELL_CAST_AT
    {
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            return;
        if (GetLocalInt(OBJECT_SELF, "nFreed") == 1)
            return;
        ExecuteScript("q2d1_illithidatk", OBJECT_SELF);
    }


}

