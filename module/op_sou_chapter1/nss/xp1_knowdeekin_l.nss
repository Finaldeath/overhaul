// the PC knows about Deekin
// Ayala has not been told about Deekin
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Deekin");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Deekin");
    if ((nKnow == 1) && (nTold == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
