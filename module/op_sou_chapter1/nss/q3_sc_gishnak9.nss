// starting conditional: chief surrendered AND player is not in command of the tribe

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
    int nSurrendered = GetLocalInt(OBJECT_SELF, "Q3_SURRENDERED");
    int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
    return (nSurrendered == 1 && nStatus != GNOLL_STATUS_CONTROL_TRIBE);
}
