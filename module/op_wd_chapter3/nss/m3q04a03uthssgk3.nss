#include "NW_I0_PLOT"

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
    int nDead = GetLocalInt(GetModule(),"NW_G_M3Q4A_UTHGARDTDEAD");
    int nAlive = 3 - nDead;
    return CheckIntelligenceNormal() &&
    GetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED") < 3
    && nClass > 0 && nAlive > 0;
    /////////// && PC has healing spells available
}

