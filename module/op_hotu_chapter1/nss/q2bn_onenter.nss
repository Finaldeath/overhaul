//::///////////////////////////////////////////////
//::
//:: q2bn_onenter
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setup the wandering monsters for this level
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: September 23, 2002
//:://////////////////////////////////////////////
#include "x2_inc_restsys"
void main()
{

    if (WMGetAreaHasTable(OBJECT_SELF) == FALSE)
    //Use the correct table for the wandering monsters on this level
        WMSetAreaTable(OBJECT_SELF,"Undermountain1North");

}
