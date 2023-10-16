#include "inc_validate"

int StartingConditional()
{
    object oPlayer;
    int nReturnValue, nAllowedItemCost;

    oPlayer = GetPCSpeaker();

    nAllowedItemCost = GetAllowedItemCostForPlayer(oPlayer);

    SetCustomToken(500,IntToString(nAllowedItemCost));

    nReturnValue = ValidatePlayer(oPlayer);
    if ( nReturnValue == VALIDATE_PLAYER_FAILED_ITEM_COST )
    {
        return TRUE;
    }

    return FALSE;
}
