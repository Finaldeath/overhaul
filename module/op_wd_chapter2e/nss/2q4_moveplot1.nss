//::///////////////////////////////////////////////
//:: Move to NPC Plot 1
//:: 2Q4_MovePlot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the persons to a point and destroys them
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 27, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_2Q4LUSKAN"
void main()
{
    SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, FALSE);
    DelayCommand(6.0, MoveTo2Q4PlotPoint(1));
    AssignCommand(OBJECT_SELF, DestroyObject(OBJECT_SELF, 16.0));
}
