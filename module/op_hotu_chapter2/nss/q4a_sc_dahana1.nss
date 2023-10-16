// Player has the power source OR he has helped one of the golems factions.

#include "x2c2_inc_plot"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if(GetLocalInt(GetModule(), "q4_power_source_taken") == 1)
        return TRUE;

   if (GetLocalInt(GetModule(),"Ferron")==99 || GetLocalInt(GetModule(),"Aghaaz")==99)
        return TRUE;

   //Commented out and replaced with globals I'm tracking in the golem conversations
   //Drew
   // if(GetPlot("q4c_journal_aghaaz") == 100 || GetPlot("q4c_journal_rebels") == 100)
    //    return TRUE;
    return FALSE;
}
