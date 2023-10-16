//::///////////////////////////////////////////////
//:: Evaine Teleport
//:: 2Q4_Evaine02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the plot to finish and teleports to the
    cutlass.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetPCSpeaker(),"PCEvaine_Plot",100);
    SetLocalInt(GetModule(),"Evaine_Plot",100);

    object oBrother = GetWaypointByTag("2Q4_EvaineJump");
    if(GetIsObjectValid(oBrother))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "2q4d_sister", GetLocation(oBrother));
    }
    EscapeViaTeleport(OBJECT_SELF);
}
