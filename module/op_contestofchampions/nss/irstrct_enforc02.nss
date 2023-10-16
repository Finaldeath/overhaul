#include "inc_validate"

int StartingConditional()
{
    object oPlayer;
    int nReturnValue;

    oPlayer = GetPCSpeaker();

    nReturnValue = ValidatePlayer(oPlayer);
    if ( nReturnValue == VALIDATE_PLAYER_SUCCESS )
    {
        return TRUE;
    }

    return FALSE;
}
