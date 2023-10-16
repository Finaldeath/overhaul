#include "inc_validate"

int StartingConditional()
{
    object oPlayer;
    int nReturnValue, nAllowedLevel;

    oPlayer = GetPCSpeaker();


    nAllowedLevel = GetAllowedLevelForPlayer(oPlayer);
    SetCustomToken(500,IntToString(nAllowedLevel));

    nReturnValue = ValidatePlayer(oPlayer);
    if ( nReturnValue == VALIDATE_PLAYER_FAILED_LOW_LEVEL ||
         nReturnValue == VALIDATE_PLAYER_FAILED_HIGH_LEVEL )
    {
        return TRUE;
    }

    return FALSE;
}
