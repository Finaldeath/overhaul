// player has the forged pass made by Aarin Gend

#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasItem(GetPCSpeaker(),"M2Q06IAARINPASS"))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
