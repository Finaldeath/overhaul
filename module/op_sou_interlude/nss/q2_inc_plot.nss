//::///////////////////////////////////////////////
//:: plot functions
//:: q2_inc_plot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Functions for setting and getting plot status and journal enteries.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////

// Setting the plot sPlotTag (as in the journal) global to nPlotNum AND change the journal to nPlotNum
void SetPlot(string sPlotTag, int nPlotNum, object oCreature)
{
    string sPlotStatus = "PLOT" + sPlotTag;
    if(GetLocalInt(GetModule(), sPlotStatus) >= nPlotNum)
        return;
    AddJournalQuestEntry(sPlotTag, nPlotNum, oCreature);
    SetLocalInt(GetModule(), sPlotStatus, nPlotNum);
    if(nPlotNum == 100) // 100 -> quest finished
    {
        int nXP = GetJournalQuestExperience(sPlotTag);
        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            GiveXPToCreature(oPC, nXP);
            oPC = GetNextPC();
        }
    }
}

// Get the current plot status
int GetPlot(string sPlotTag)
{
    return GetLocalInt(GetModule(), "PLOT" + sPlotTag);
}
