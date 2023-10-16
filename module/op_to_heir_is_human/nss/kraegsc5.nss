#include "NW_I0_PLOT"

int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(),"Kraegen_Name")!=10 &&
    CheckIntelligenceNormal();
}

