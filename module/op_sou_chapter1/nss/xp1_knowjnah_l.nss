// the PC knows about J'Nah
// Ayala has not been told about J'Nah
// the PC is of low Intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Jnah");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Jnah");
    if ((nKnow == 1) && (nTold == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
