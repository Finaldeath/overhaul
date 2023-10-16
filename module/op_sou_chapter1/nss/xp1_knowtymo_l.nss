// the PC knows about Tymofarrar
// Ayala has not been told about Tymofarrar
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Tymo");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Tymo");
    if ((nKnow == 1) && (nTold == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
