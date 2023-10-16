//::///////////////////////////////////////////////
//:: m1q2 Main District Plot Done
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns True if the main plot of the
    Peninusla district has been completed, meaning
    the Intellect Devourer has been killed.
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
return GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot")>=100;
}
