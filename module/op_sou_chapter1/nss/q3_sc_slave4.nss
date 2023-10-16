// slave starting conditional:
// not the first time speaking to one of the slaves AND the PC has made peaceful passage with the gnolls
// AND the module variable "q3_Slave_Hate" is set to 0

#include "q3_inc_plot"

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

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "q3_PC_Know_Slaves");
    int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
    int nHate = GetLocalInt(GetModule(), "q3_Slave_Hate");
    return (nKnow != 0 && nStatus == GNOLL_STATUS_SAFE_PASSAGE && nHate == 0);
}
