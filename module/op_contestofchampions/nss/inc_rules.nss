//////////////////////////////////////////////////////////////
// inc_rules :: Default Include file for rules implementation.
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
//////////////////////////////////////////////////////////////

// Default initialization data
int DEFAULT_NUM_TEAMS               = 2;
// I wouldn't change this if I were you...
int DEFAULT_MAX_TEAMS               = 4;
int DEFAULT_NUM_LEVELS              = 1;
int DEFAULT_ITEM_COST_RESTRICTION   = 10000;
int DEFAULT_LEVEL_RESTRICTION       = 10;

// This is the amount of gold that a creature will
// get when entering the actual game if the
// setting is on no item cost limitation.
int DEFAULT_AMOUNT_OF_STARTING_GOLD = 10000;

float DEFAULT_COST_FACTOR_BARBARIAN   = 3.0f;
float DEFAULT_COST_FACTOR_BARD        = 3.0f;
float DEFAULT_COST_FACTOR_CLERIC      = 1.0f;
float DEFAULT_COST_FACTOR_DRUID       = 1.3f;
float DEFAULT_COST_FACTOR_FIGHTER     = 3.0f;
float DEFAULT_COST_FACTOR_MONK        = 2.5f;
float DEFAULT_COST_FACTOR_PALADIN     = 2.8f;
float DEFAULT_COST_FACTOR_RANGER      = 2.7f;
float DEFAULT_COST_FACTOR_ROGUE       = 3.0f;
float DEFAULT_COST_FACTOR_SORCERER    = 1.5f;
float DEFAULT_COST_FACTOR_WIZARD      = 1.5f;

// Constants for Level Restrictions
int LEVEL_LIMIT_NONE    = -1;

// Constants for Item Cost Limitations
int ITEM_COST_UNLIMITED = -1;
int GetTotalPlayerItemCost( object oPlayer );
int GetTotalPlayerLevel( object oPlayer );
int GetAllowedItemCostForPlayer( object oPlayer, int bBaseVale = FALSE );
int GetAllowedLevelForPlayer( object oPlayer, int bBaseValue = FALSE );

// Class Access functions
int GetPrimaryClass( object oPlayer );

// Xp Rules Functions
int GetXPRequiredForLevel( int nLevel );

//////////////////////////////////////////////////////////////
// GetTotalPlayerItemCost()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Calculates the total item cost on a specified
//              creature.
//////////////////////////////////////////////////////////////
int GetTotalPlayerItemCost( object oPlayer )
{
    int nCount, nTotalCost = 0;
    object oItem;

    // Calculate the total cost of items in the creature's
    // repository
    oItem = GetFirstItemInInventory(oPlayer);
    while ( GetIsObjectValid(oItem) == TRUE )
    {
        nTotalCost += GetGoldPieceValue(oItem);
        oItem = GetNextItemInInventory(oPlayer);
    }

    // Now iterate through each inventory slot and compute
    // the cost of the item (if one exists in that slot)
    // - BKH - Jun/09/02
    for ( nCount = 0; nCount < NUM_INVENTORY_SLOTS; nCount++ )
    {
        oItem = GetItemInSlot(nCount,oPlayer);
        if ( GetIsObjectValid(oItem) )
        {
            nTotalCost += GetGoldPieceValue(oItem);
        }
    }

    return nTotalCost;
}

//////////////////////////////////////////////////////////////
// GetTotalPlayerLevel()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Calculates the total levels of a specified
//              creature.
//////////////////////////////////////////////////////////////
int GetTotalPlayerLevel( object oPlayer )
{
    return GetHitDice(oPlayer);
}

//////////////////////////////////////////////////////////////
// GetAllowedItemCostForPlayer()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Calculates the scaled item cost for the specified
//              player.
//////////////////////////////////////////////////////////////
int GetAllowedItemCostForPlayer( object oPlayer, int bBaseValue )
{
    int nClass;
    int nAllowedCost;

    nAllowedCost = GetLocalInt(GetModule(),"m_nAllowedItemCost");

    if ( nAllowedCost == ITEM_COST_UNLIMITED &&
         bBaseValue == FALSE )
    {
        return 400000000;
    }
    else if ( nAllowedCost == ITEM_COST_UNLIMITED )
    {
        return ITEM_COST_UNLIMITED;
    }

    if ( bBaseValue == TRUE )
    {
        return nAllowedCost;
    }

    nClass = GetPrimaryClass(oPlayer);
    switch ( nClass )
    {
        case CLASS_TYPE_BARBARIAN:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_BARBARIAN);

        case CLASS_TYPE_BARD:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_BARD);

        case CLASS_TYPE_CLERIC:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_CLERIC);

        case CLASS_TYPE_DRUID:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_DRUID);

        case CLASS_TYPE_FIGHTER:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_FIGHTER);

        case CLASS_TYPE_MONK:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_MONK);

        case CLASS_TYPE_PALADIN:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_PALADIN);

        case CLASS_TYPE_RANGER:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_RANGER);

        case CLASS_TYPE_ROGUE:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_ROGUE);

        case CLASS_TYPE_SORCERER:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_SORCERER);

        case CLASS_TYPE_WIZARD:
            return FloatToInt(nAllowedCost * DEFAULT_COST_FACTOR_WIZARD);
    }

    return nAllowedCost;
}

//////////////////////////////////////////////////////////////
// GetAllowedLevelForPlayer()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Calculates the scaled level for the specified
//              player.
//////////////////////////////////////////////////////////////
int GetAllowedLevelForPlayer( object oPlayer, int bBaseValue )
{
    int nAllowedLevel;
    nAllowedLevel = GetLocalInt(GetModule(),"m_nAllowedLevel");

    if ( bBaseValue == TRUE )
    {
        return nAllowedLevel;
    }

    // We don't have any level scaling yet...
    // maybe we will in the future for some fun stuff.

    return nAllowedLevel;
}

//////////////////////////////////////////////////////////////
// GetPrimaryClass()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Returns the primary class of the specified
//              player.
//////////////////////////////////////////////////////////////
int GetPrimaryClass( object oPlayer )
{
    int nCount, nClass;
    int nClassLevel, nPrimaryClass;
    int nBestClass, nBestClassLevel;

    nBestClassLevel = 0;
    nPrimaryClass = CLASS_TYPE_INVALID;

    // Stupid 1 based indexes...
    for ( nCount = 1; nCount <= 3; nCount++ )
    {
        nClass = GetClassByPosition(nCount,oPlayer);
        if ( nClass != CLASS_TYPE_INVALID )
        {
            nClassLevel = GetLevelByClass(nClass,oPlayer);
            if ( nClassLevel > nBestClassLevel )
            {
                nBestClassLevel = nClassLevel;
                nPrimaryClass = nClass;
            }
        }
    }

    return nPrimaryClass;
}

//////////////////////////////////////////////////////////////
// GetXPRequiredForLevel()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Calculates the amount of experience required
//              for the specified level.
//////////////////////////////////////////////////////////////
int GetXPRequiredForLevel( int nLevel )
{
    int nRequiredXP;
    int nCount;

    nRequiredXP = 0;

    for ( nCount = 1; nCount <= nLevel; nCount++ )
    {
        nRequiredXP += 1000 * (nCount - 1);
    }

    return nRequiredXP;
}
