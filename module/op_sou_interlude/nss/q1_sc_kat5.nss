// Katriana starting conditional: player has been in stinger caves but not in temple
#include "x1_inc_plot"

int StartingConditional()
{
    int nCaves = GetLocalInt(GetPCSpeaker(), "Q1_BEEN_IN_CAVES");
    int nTemple = GetLocalInt(GetPCSpeaker(), "Q1_BEEN_IN_TEMPLE");
    return nCaves == 1 && nTemple == 0;
}
