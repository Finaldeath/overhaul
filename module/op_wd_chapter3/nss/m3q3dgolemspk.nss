#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {    // * only happen once
            SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, FALSE);
            return TRUE;
        }
    }
    return FALSE;
}


