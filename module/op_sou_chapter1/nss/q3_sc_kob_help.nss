// player can only ask kobolds to help fight the gnoll chief ONLY if he is alive AND has not surrendered yet

 /*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

#include "q3_inc_plot"

int StartingConditional()
{
    int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
    object oChief = GetNearestObjectByTag("Q3_CHIEF_GISHNAK");
    if(oChief == OBJECT_INVALID)
        return FALSE;
    if(GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") == 100)
        return FALSE;
    int nSurr = GetLocalInt(oChief, "Q3_SURRENDERED");
    if(nStatus != GNOLL_STATUS_DEAD && nSurr == 0)
        return TRUE;
    return FALSE;
}
