//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 1, 2002
//:://////////////////////////////////////////////

#include "achievement_lib"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M2MainPlotActive") > 0)
    {
       SetLocalInt(GetModule(),"NW_G_M2MainPlotActive",GetLocalInt(GetModule(),"NW_G_M2MainPlotActive") - 1);
    }
    if (GetLocalInt(GetModule(),"NW_G_M2MainPlotDelay") > 1)
    {
       SetLocalInt(GetModule(),"NW_G_M2MainPlotDelay",GetLocalInt(GetModule(),"NW_G_M2MainPlotDelay") - 1);
    }
    else if (GetLocalInt(GetModule(),"NW_G_M2MainPlotDelay") == 1)
    {
        if (GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") < 4)
        {
            SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",4);
        }
    }
    object oPC = GetFirstPC();

    while(GetIsObjectValid(oPC)){
        CheckAchievements(oPC, GetModule());
        oPC = GetNextPC();
    }

}
