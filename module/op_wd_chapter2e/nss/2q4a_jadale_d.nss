//::///////////////////////////////////////////////
//:: Jadale Custom User Defined
//:: 2Q4A_JADALE_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jadale Runs to corner of kitcheon if she
    still has the ring cowers in the corner.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 14, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"

void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oErb = GetObjectByTag("2Q4C_Erb");

    if(nUser == 1002)
    {
        if(GetHas2Q4PlotItem(OBJECT_SELF, PLOT_2Q4_ITEM_ERBS_RING))
        {
            if(GetCanSeePC())
            {
                ClearAllActions();
                MoveTo2Q4PlotPoint(1);
            }
        }
    }
}
