// * one line everytime sees player
#include "nw_i0_generic"
int StartingConditional()
{
    int iResult = FALSE;
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION))
    {
        SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION, FALSE);
    iResult =  GetLocalInt(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),"NW_L_TALKPAST") ==0 &&
               !GetIsObjectValid(GetPCSpeaker());
    }
    return iResult;
}

