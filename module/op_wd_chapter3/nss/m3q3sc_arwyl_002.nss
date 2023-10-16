// * Tell player to come talk to her
#include "nw_i0_generic"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, FALSE);
            return !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1;;
        }
    }
    return FALSE;
}

