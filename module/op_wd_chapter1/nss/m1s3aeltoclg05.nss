#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetPCSpeaker(),"NW_L_M1S3Tests") == 0 &&
                     CheckIntelligenceNormal();
    return bCondition;
}
