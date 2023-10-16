//////Checks if player already told about plot

#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = GetPlayerAcceptedYusamQuest(GetPCSpeaker());
    return iResult;
}
