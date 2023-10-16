//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2a_ud_tan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        object oChair = GetObjectByTag("q2atanchair");
        ActionSit(oChair);

    }


}

