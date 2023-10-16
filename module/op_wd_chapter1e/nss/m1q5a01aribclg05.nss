// Returns true if Fenthick has spoken of the key to this player
// and that the current playr has low intelligence

#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetPCSpeaker(),"NW_L_M1Q6A01FenthickKey") &&
                     CheckIntelligenceLow();
    return bCondition;
}
