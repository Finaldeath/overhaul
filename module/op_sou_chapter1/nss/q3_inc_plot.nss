//::///////////////////////////////////////////////
//:: plot functions
//:: q5_inc_plot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Functions for setting and getting plot status and journal enteries.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 27/2/2003
//:://////////////////////////////////////////////

// values for Q3_GNOLL_STATUS:
int GNOLL_STATUS_INIT =             0; // initial status
int GNOLL_STATUS_LEFT =             1; // all gnoll left the area
int GNOLL_STATUS_DEAD =             2; // chief is dead
int GNOLL_STATUS_SAFE_PASSAGE =     3; // gnollsgave safe passge
int GNOLL_STATUS_CONTROL_TRIBE=     4; // player has full control over the tribe

// values for Q3_GNOLL_HELP
int GNOLL_NOHELP = 0;
int GNOLL_HELP = 1;

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
