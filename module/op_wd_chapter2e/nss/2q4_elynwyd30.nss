//::///////////////////////////////////////////////
//:: Evaine and Elynwyd Leave the Area
//:: 2q4_Elynwyd30
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 20, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oTarget = GetObjectByTag("M2Q05CEVAINE");
    if (GetIsObjectValid(oTarget))
    {
        AssignCommand(oTarget, EscapeArea());
        EscapeArea();
    }
}
