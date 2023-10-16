#include "NW_I0_PLOT"

int StartingConditional()
{
    int iMaug = GetLocalInt(OBJECT_SELF,"Yeanasha_Mention_Maug");
    if (iMaug == 0)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
