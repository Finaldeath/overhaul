#include "help_conv"

int StartingConditional()
{
    int nNumber = GetLocalInt(GetModule(), "N_COMM_MAX_RAND");

    int nRandom = Random(nNumber);

    SetSelfTalkLevelInt(OBJECT_SELF, nRandom);

    return FALSE;
}
