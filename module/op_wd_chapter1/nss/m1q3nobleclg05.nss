#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetGender(GetPCSpeaker()) == GetGender(OBJECT_SELF) &&
                     CheckIntelligenceLow();
    return bCondition;
}
