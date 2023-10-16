// the PC knows about the gnoll ambush
// Ayala has not been told about the gnoll ambush
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Ambush");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Ambush");
    if ((nKnow == 1) && (nTold == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
