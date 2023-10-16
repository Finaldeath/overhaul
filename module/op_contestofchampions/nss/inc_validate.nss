//////////////////////////////////////////////////////////////
// inc_validate :: Default Include file for the validation
//                  of creatures.
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
//////////////////////////////////////////////////////////////

#include "inc_rules"

// Constants for Player Validation
int VALIDATE_PLAYER_FAILED_ITEM_COST    = 0;
int VALIDATE_PLAYER_FAILED_HIGH_LEVEL   = 1;
int VALIDATE_PLAYER_FAILED_LOW_LEVEL    = 2;
int VALIDATE_PLAYER_SUCCESS             = 3;

int ValidatePlayer( object oPlayer );

//////////////////////////////////////////////////////////////
// ValidatePlayer()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Checks the module rules specifications to see
//              if the specified creature passes muster.
//              Then returns an error code based on which
//              portion of the validation fails.
//////////////////////////////////////////////////////////////
int ValidatePlayer( object oPlayer )
{
    int nAllowedItemCost, nTotalPlayerItemCost;
    int nAllowedLevel, nTotalPlayerLevel;
    int nAllowedXP;

    // 1 - Check Item Cost restrictions on the module
    nAllowedItemCost = GetAllowedItemCostForPlayer(oPlayer);
    if ( nAllowedItemCost != ITEM_COST_UNLIMITED )
    {
        nTotalPlayerItemCost = GetTotalPlayerItemCost(oPlayer);
        if ( nTotalPlayerItemCost > nAllowedItemCost )
        {
            return VALIDATE_PLAYER_FAILED_ITEM_COST;
        }
    }

    // 2 - Check Level restrictions on the module
    nAllowedLevel = GetAllowedLevelForPlayer(oPlayer);
    if ( nAllowedLevel != LEVEL_LIMIT_NONE )
    {
        nTotalPlayerLevel = GetTotalPlayerLevel(oPlayer);
        if ( nTotalPlayerLevel > nAllowedLevel )
        {
            return VALIDATE_PLAYER_FAILED_HIGH_LEVEL;
        }
        else if ( nTotalPlayerLevel < nAllowedLevel )
        {
            return VALIDATE_PLAYER_FAILED_LOW_LEVEL;
        }
    }

    // 3 - After checking the level, check the experience
    // if it's not correct... set it.
    nAllowedXP = GetXPRequiredForLevel(nAllowedLevel);
    if ( nAllowedXP != GetXP(oPlayer) )
    {
        SetXP(oPlayer,nAllowedXP);
    }

    return VALIDATE_PLAYER_SUCCESS;
}
