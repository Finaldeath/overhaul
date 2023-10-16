//::///////////////////////////////////////////////
//:: Set Local Generic Plot Flag to 10 and move
//:: 2Q4_MOVEPROS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the local plot flag at 10
    Move to Gen Way 1
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 14, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"

void main()
{
    SetLocalPlotIntOnCharacter(OBJECT_SELF, 10);
    MoveTo2Q4PlotPoint(1);
    AssignCommand(OBJECT_SELF, SetLocalPlotIntOnCharacter(OBJECT_SELF, 20));
}
