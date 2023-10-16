//////////////////////////////////////////////////////////////
// inc_module :: Default Include file for the module
//                   containes area-wide access functions.
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
//////////////////////////////////////////////////////////////

#include "inc_validate"

// User Defined Event Constants

// Note that this value will be incremented
// by the team index when sent. So no other
// user defined event should fall within the
// range of EVENT_ADD_PLAYER_TO_TEAM + MaxNumTeams.
int EVENT_ADD_PLAYER_TO_TEAM        = 200;

// Note that this value will be incremented
// by the team index when sent. So no other
// user defined event should fall within the
// range of EVENT_REMOVE_PLAYER_FROM_TEAM + MaxNumTeams.
int EVENT_REMOVE_PLAYER_FROM_TEAM   = 210;

// Note that we use this number + 10, the
// 10 being data that we use to identify
// what count we're at in the countdown
// to start the game.
int EVENT_START_GAME                = 220;
int DEFAULT_COUNTDOWN_TIME          = 11;

int EVENT_UNLOCK_LEVER              = 300;
int EVENT_ACTIVATE_GAME             = 301;
int EVENT_DEACTIVATE_GAME           = 302;

// Game Initialization Functions
void RemoveAllPlotItems( object oPlayer );
int  IncrementNumPlayers();
int  DecrementNumPlayers();
void IncrementNumLockedTeams();
void DecrementNumLockedTeams();
void StartCountDown();
void CancelCountDown();
void RestartModule();
void InitializeModule();
void IntializePlayerForGame( object oPlayer );
void MoveMeToLocation( location lLoc );
void MovePlayerToStartLocation( object oPlayer );

// Map/Level Functionality
void SetNumMaps( int nNumMaps );
int  GetNumMaps();
void InitializeMapList();
void SetActiveBattleMap( int nMapIndex );
int  GetActiveBattleMap();

// Battlemaster Functions
void   SetBattleMaster( object oPlayer );
object GetBattleMaster();
void   GetNewBattleMaster();

// Rule Constants
int RULE_ALLOWED_COST       = 0;
int RULE_ALLOWED_LEVEL      = 1;
int RULE_NUM_TEAMS          = 2;
int RULE_NUM_GAMES          = 3;
void BroadcastRuleChange( int nRule, int nChange );

// Game Specific Functionality
void     CheckAllPlayersOut();
void     CheckPlayerOut( object oPlayer );
int      CheckPlayerIn( object oPlayer );
int      GetPlayerCheckedIn( object oPlayer );
void     ApplyFlagEffect( object oPlayer );
void     RemoveAllEffects( object oPlayer );
void     RemoveAllGoldFromPlayer( object oPlayer );
location GetGameStartLocation( int nMapIndex, object oPlayer );
void     MovePlayerToGameStartLocation( int nMapIndex, object oPlayer );

// Game State Functionality
void SetGameStarted( int bGameStarted );
int  GetGameStarted();
void StartGame();
void EndTheGame();
void IncrementNumGamesPlayed();
void RewardWinningTeam(int nTeam);

// Module Options
int OPTION_ALLOWED_ITEM_COST        = 0;
int OPTION_ALLOWED_LEVEL            = 1;
int OPTION_RANDOM_START_LOC         = 2;
int OPTION_NUM_TEAMS                = 3;
int OPTION_NUM_GAMES                = 4;
void SetGameOption( int nOption, int nData );
int  GetGameOption( int nOption );

// Team Specific Functionality

// Team Constants
int TEAM_BLUE   = 0;    // Blue
int TEAM_RED    = 1;    // Red
int TEAM_GOLD   = 2;    // Gold
int TEAM_PURPLE = 3;    // Purple

// Team Functions
int      GetNumTeams();
int      GetMaxTeams();
void     SelectTeam( object oPlayer );
void     RandomizeTeamStartLocations();
location GetTeamStartLocation( object oPlayer );
int      AddPlayerToTeam( int nTeam, object oPlayer );
int      RemovePlayerFromTeam( int nTeam, object oPlayer );
int      GetPlayerTeam( object oPlayer );
void     UnlockAllTeams();
void     SetTeamLocked( int nTeam, int bLocked );
int      GetTeamLocked( int nTeam );
void     BroadcastTeamLockedState( int nTeam, int bLocked );
void     ApplyLockedEffect( object oLever );
void     RemoveLockedEffect( object oLever );
string   GetTeamName(int nTeam);

// Team Data Constants
int TEAM_NUM_PLAYERS        = 0;
int TEAM_LOCKED_STATE       = 1;
int TEAM_START_LOC_INDEX    = 2;
int SetTeamData( int nTeam, int nDataType, int nData );
int GetTeamData( int nTeam, int nDataType );

// Observer Mode Constants
string OBSERVER_MODE        = "Observer";

// Observer Mode Functions
void ApplyObserverModeEffects(object oPlayer);
int GetIsObserver(object oPlayer);
void SetObserver(object oPlayer, int nStatus);

//////////////////////////////////////////////////////////////
// RemoveAllPlotItems()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/14/02
// Description: Removes all plot items from a creature.
//////////////////////////////////////////////////////////////
void RemoveAllPlotItems( object oPlayer )
{
    object oItem;
    int nCount;

    oItem = GetFirstItemInInventory(oPlayer);
    while ( GetIsObjectValid(oItem) == TRUE )
    {
        if ( GetPlotFlag(oItem) == TRUE )
        {
            DestroyObject(oItem);
        }

        oItem = GetNextItemInInventory(oPlayer);
    }

    // Now iterate through each inventory slot and compute
    // the cost of the item (if one exists in that slot)
    // - BKH - Jun/17/02
    for ( nCount = 0; nCount < NUM_INVENTORY_SLOTS; nCount++ )
    {
        oItem = GetItemInSlot(nCount,oPlayer);
        if ( GetPlotFlag(oItem) == TRUE )
        {
            DestroyObject(oItem);
        }
    }
}

//////////////////////////////////////////////////////////////
// IncrementNumPlayers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Increments the number of players in the module.
//////////////////////////////////////////////////////////////
int IncrementNumPlayers()
{
    int nNumPlayers;
    nNumPlayers = GetLocalInt(GetModule(),"m_nNumPlayers");
    ++nNumPlayers;

    SetLocalInt(GetModule(),"m_nNumPlayers",nNumPlayers);

    return nNumPlayers;
}

//////////////////////////////////////////////////////////////
// DecrementNumPlayers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Decrements the number of players in the module.
//////////////////////////////////////////////////////////////
int DecrementNumPlayers()
{
    int nNumPlayers;
    nNumPlayers = GetLocalInt(GetModule(),"m_nNumPlayers");
    --nNumPlayers;

    SetLocalInt(GetModule(),"m_nNumPlayers",nNumPlayers);

    return nNumPlayers;
}

//////////////////////////////////////////////////////////////
// IncrementNumLockedTeams()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Increments the number of locked teams.
//////////////////////////////////////////////////////////////
void IncrementNumLockedTeams()
{
    int nNumLockedTeams;

    nNumLockedTeams = GetLocalInt(GetModule(),"m_nNumLockedTeams");
    ++nNumLockedTeams;

    SetLocalInt(GetModule(),"m_nNumLockedTeams",nNumLockedTeams);

    if ( nNumLockedTeams == GetNumTeams() )
    {
        PrintString("The number of locked teams is equal to the total number of teams.");
        PrintString("Starting Countdown.");
        StartCountDown();
    }
}

//////////////////////////////////////////////////////////////
// DecrementNumLockedTeams()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Decrements the number of locked teams.
//////////////////////////////////////////////////////////////
void DecrementNumLockedTeams()
{
    int nNumLockedTeams;
    int bGamePending;

    bGamePending = GetLocalInt(GetModule(),"m_bGamePending");

    nNumLockedTeams = GetLocalInt(GetModule(),"m_nNumLockedTeams");
    if ( nNumLockedTeams == GetNumTeams() &&
         bGamePending == TRUE )
    {
        CancelCountDown();
    }

    --nNumLockedTeams;
    SetLocalInt(GetModule(),"m_nNumLockedTeams",nNumLockedTeams);
}

//////////////////////////////////////////////////////////////
// StartCountDown()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Starts the countdown.
//////////////////////////////////////////////////////////////
void StartCountDown()
{
    event evUserDefined;

    SetLocalInt(GetModule(),"m_bGamePending",TRUE);

    evUserDefined = EventUserDefined(EVENT_START_GAME + DEFAULT_COUNTDOWN_TIME);
    SignalEvent(GetModule(),evUserDefined);
}

//////////////////////////////////////////////////////////////
// CancelCountDown()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Cancels the countdown.
//////////////////////////////////////////////////////////////
void CancelCountDown()
{
    SetLocalInt(GetModule(),"m_bCancelCountDown",TRUE);
}

//////////////////////////////////////////////////////////////
// BroadcastCancelCountDown()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Broadcasts out the cancel message for the
//              countdown.
//////////////////////////////////////////////////////////////
void BroadcastCancelCountDown()
{
    object oPlayer;
    string sCancelMessage;

    sCancelMessage = "Countdown to game start cancelled.";

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        SendMessageToPC(oPlayer,sCancelMessage);
        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// BroadcastCountDownTime()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Broadcasts out the countdown time remaining.
//////////////////////////////////////////////////////////////
void BroadcastCountDownTime( int nTimeRemaining )
{
    object oPlayer;
    string sTimeMessage;

    if ( nTimeRemaining > 0 )
    {
        sTimeMessage = IntToString(nTimeRemaining) + " second(s) until Game Start...";
    }
    else
    {
        sTimeMessage = "Game Starting...";
    }

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        SendMessageToPC(oPlayer,sTimeMessage);
        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// RestartModule()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Resets the entire module state, pulling all
//              players back to the main spawn area and removing
//              all effects on those players.
//////////////////////////////////////////////////////////////
void RestartModule()
{
    object oPlayer, oArea;
    object oStartArea, oStartWaypoint;
    int nTeam;

    oStartWaypoint = GetObjectByTag("irestrict_start");
    oStartArea = GetArea(oStartWaypoint);

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        if ( GetArea(oPlayer) != oStartArea )
        {
            CheckPlayerOut(oPlayer);
            nTeam = GetPlayerTeam(oPlayer);

            RemovePlayerFromTeam(nTeam,oPlayer);
            AssignCommand(oPlayer,MoveMeToLocation(GetLocation(oStartWaypoint)));
        }

        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// InitializeModule()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Initializes the module with some default
//              values.
//////////////////////////////////////////////////////////////
void InitializeModule()
{
    InitializeMapList();
    SetActiveBattleMap(0);

    SetGameOption(OPTION_NUM_TEAMS,2);
    SetGameOption(OPTION_NUM_GAMES,5);
    SetGameOption(OPTION_ALLOWED_ITEM_COST,DEFAULT_ITEM_COST_RESTRICTION);
    SetGameOption(OPTION_ALLOWED_LEVEL,DEFAULT_LEVEL_RESTRICTION);
    RandomizeTeamStartLocations();
}

//////////////////////////////////////////////////////////////
// SetNumMaps()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Sets the number of maps in the game.
//////////////////////////////////////////////////////////////
void SetNumMaps( int nNumMaps )
{
    SetLocalInt(GetModule(),"m_nNumMaps",nNumMaps);
}

//////////////////////////////////////////////////////////////
// GetNumMaps()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Returns the number of maps.
//////////////////////////////////////////////////////////////
int GetNumMaps()
{
    return GetLocalInt(GetModule(),"m_nNumMaps");
}

//////////////////////////////////////////////////////////////
// InitializeModule()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Initializes the module with some default
//              values.
//////////////////////////////////////////////////////////////
void InitializeMapList()
{
    string sVarName;
    object oArea;
    int nCount, nNumLevels;

    nNumLevels = 2;
    SetNumMaps(nNumLevels);

    // Hardcoded Map List
    for ( nCount = 0; nCount < nNumLevels; nCount++ )
    {
        sVarName = "Level" + IntToString(nCount);

        oArea = GetObjectByTag(sVarName);
        SetLocalObject(GetModule(),sVarName,oArea);
    }
}

//////////////////////////////////////////////////////////////
// GetMapByIndex()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Returns the object of the currently active
//              area.
//////////////////////////////////////////////////////////////
object GetMapByIndex( int nMapIndex )
{
    string sVarName;

    if ( nMapIndex > GetNumMaps() - 1 )
    {
        return OBJECT_INVALID;
    }

    sVarName = "Level" + IntToString(nMapIndex);

    return GetLocalObject(GetModule(),sVarName);
}

//////////////////////////////////////////////////////////////
// SetActiveBattleMap()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Sets the index for the active battle map.
//////////////////////////////////////////////////////////////
void SetActiveBattleMap( int nMapIndex )
{
    SetLocalInt(GetModule(),"m_nActiveMap",nMapIndex);
}

//////////////////////////////////////////////////////////////
// GetActiveBattleMap()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Gets the index for the active battle map.
//////////////////////////////////////////////////////////////
int GetActiveBattleMap()
{
    return GetLocalInt(GetModule(),"m_nActiveMap");
}

//////////////////////////////////////////////////////////////
// SetBattleMaster()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Sets up the battlemaster and signals a message
//              to that player. These functions should only
//              ever be run on the module. ie: module scripts.
//////////////////////////////////////////////////////////////
void SetBattleMaster( object oPlayer )
{
    SetLocalObject(GetModule(),"m_oBattleMaster",oPlayer);
    AssignCommand(oPlayer,SendMessageToPC(oPlayer,"You are now the Battle Master and may change the game options."));
}

//////////////////////////////////////////////////////////////
// GetBattleMaster()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Gets the battlemaster.
//////////////////////////////////////////////////////////////
object GetBattleMaster()
{
    return GetLocalObject(GetModule(),"m_oBattleMaster");
}

//////////////////////////////////////////////////////////////
// GetNewBattleMaster()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Gets a new battle master.
//////////////////////////////////////////////////////////////
void GetNewBattleMaster()
{
    object oPlayer;

    oPlayer = GetFirstPC();
    SetLocalObject(GetModule(),"m_oBattleMaster",oPlayer);
    AssignCommand(oPlayer,SendMessageToPC(oPlayer,"You are now the Battle Master and may change the game options."));
}

//////////////////////////////////////////////////////////////
// InitializePlayerForGame()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Initializes the player with a team and sets
//              up the base statistics values for that player.
//////////////////////////////////////////////////////////////
void InitializePlayerForGame( object oPlayer )
{
    PrintString("Selecting a team for player: " + GetName(oPlayer));
    SelectTeam(oPlayer);

    // Add stat tracking later
    // InitializeStats(oPlayer);
}

//////////////////////////////////////////////////////////////
// MoveMeToLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/14/02
// Description: Moves this creature to their designated start
//              location.
//////////////////////////////////////////////////////////////
void MoveMeToLocation( location lLoc )
{
    ClearAllActions();
    JumpToLocation(lLoc);
}

//////////////////////////////////////////////////////////////
// MovePlayerToStartLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Moves a player to their designated start
//              location.
//////////////////////////////////////////////////////////////
void MovePlayerToStartLocation( object oPlayer )
{
    location lStartLoc;

    lStartLoc = GetTeamStartLocation(oPlayer);
    AssignCommand(oPlayer,MoveMeToLocation(lStartLoc));
}

//////////////////////////////////////////////////////////////
// BroadcastRuleChange()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Broadcasts out a message to all players that
//              there has been a rule change.
//////////////////////////////////////////////////////////////
void BroadcastRuleChange( int nRule, int nChange )
{
    object oPlayer;
    string sRuleChange;

    if ( nRule == RULE_ALLOWED_COST )
    {
        if ( nChange == ITEM_COST_UNLIMITED )
        {
            sRuleChange = "The Allowed Item Cost has been changed to: Unlimited";
        }
        else
        {
            sRuleChange = "The Allowed Item Cost has been changed to: " + IntToString(nChange);
        }
    }
    else if ( nRule == RULE_ALLOWED_LEVEL )
    {
        if ( nChange == LEVEL_LIMIT_NONE )
        {
            sRuleChange = "The Allowed Level has been changed to: Unlimited";
        }
        else
        {
            sRuleChange = "The Allowed Level has been changed to: " + IntToString(nChange);
        }
    }
    else if ( nRule == RULE_NUM_TEAMS )
    {
        sRuleChange = "There are now: " + IntToString(nChange) + " teams available";
    }
    else if ( nRule == RULE_NUM_GAMES )
    {
        sRuleChange = "The game will now go to: " + IntToString(nChange) + " before switching maps";
    }

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        SendMessageToPC(oPlayer,sRuleChange);
        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// CheckAllPlayersOut()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/13/02
// Description: Checks all players out.
//////////////////////////////////////////////////////////////
void CheckAllPlayersOut()
{
    object oPlayer;

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        CheckPlayerOut(oPlayer);
        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// CheckPlayerOut()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Checks a player out.
//////////////////////////////////////////////////////////////
void CheckPlayerOut( object oPlayer )
{
    PrintString("Player: " + GetName(oPlayer) + " Checked out.");
    SetLocalInt(oPlayer,"m_bCheckedIn",FALSE);
    RemoveAllEffects(oPlayer);

    SetCommandable(TRUE, oPlayer);
}

//////////////////////////////////////////////////////////////
// CheckPlayerIn()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Checks a player in.
//////////////////////////////////////////////////////////////
int CheckPlayerIn( object oPlayer )
{
    int nTeam;

    nTeam = GetPlayerTeam(oPlayer);

    if ( GetTeamLocked(nTeam) == FALSE )
    {
        PrintString("Player: " + GetName(oPlayer) + " Checked in.");
        SetLocalInt(oPlayer,"m_bCheckedIn",TRUE);
        ApplyFlagEffect(oPlayer);
        return TRUE;
    }
    else
    {
        PrintString("The Team Is Locked. Cannot Check Player In.");
    }

    return FALSE;
}

//////////////////////////////////////////////////////////////
// GetPlayerCheckedIn()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Returns whether the player is checked in or
//              not.
//////////////////////////////////////////////////////////////
int GetPlayerCheckedIn( object oPlayer )
{
    return GetLocalInt(oPlayer,"m_bCheckedIn");
}

//////////////////////////////////////////////////////////////
// ApplyFlagEffect()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Applies the team specific flag effect to the
//              player.
//////////////////////////////////////////////////////////////
void ApplyFlagEffect( object oPlayer )
{
    int nTeam, nVisEffect;
    effect eFlagEffect;

    nTeam = GetPlayerTeam(oPlayer);
    if ( nTeam == TEAM_BLUE )
    {
        nVisEffect = VFX_DUR_FLAG_BLUE;
    }
    else if ( nTeam == TEAM_RED )
    {
        nVisEffect = VFX_DUR_FLAG_RED;
    }
    else if ( nTeam == TEAM_GOLD )
    {
        nVisEffect = VFX_DUR_FLAG_PURPLE;
    }
    else if ( nTeam == TEAM_PURPLE )
    {
        nVisEffect = VFX_DUR_FLAG_GOLD;
    }

    eFlagEffect = EffectVisualEffect(nVisEffect);
    eFlagEffect = SupernaturalEffect(eFlagEffect);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFlagEffect,oPlayer);
    PlaySound("as_mg_telepout1");
}

//////////////////////////////////////////////////////////////
// RemoveAllEffects()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Removes all non-permanent/innate/equipped
//              effects from the specified player.
//////////////////////////////////////////////////////////////
void RemoveAllEffects( object oPlayer )
{
    effect eEffect;
    eEffect = GetFirstEffect(oPlayer);

    while ( GetIsEffectValid(eEffect) == TRUE )
    {
        if ( GetEffectDurationType(eEffect) == DURATION_TYPE_TEMPORARY ||
             GetEffectDurationType(eEffect) == DURATION_TYPE_PERMANENT )
        {
            RemoveEffect(oPlayer,eEffect);
        }

        eEffect = GetNextEffect(oPlayer);
    }
}

//////////////////////////////////////////////////////////////
// RemoveAllGoldFromPlayer()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Removes all gold from the specified player.
//////////////////////////////////////////////////////////////
void RemoveAllGoldFromPlayer( object oPlayer )
{
    TakeGoldFromCreature(GetGold(oPlayer),oPlayer,TRUE);
}

//////////////////////////////////////////////////////////////
// SetGameStarted()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Sets the game state as started.
//////////////////////////////////////////////////////////////
void SetGameStarted( int bGameStarted )
{
    SetLocalInt(GetModule(),"m_bGameStarted",bGameStarted);
}

//////////////////////////////////////////////////////////////
// GetGameStarted()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Returns TRUE if the game has started already.
//////////////////////////////////////////////////////////////
int GetGameStarted()
{
    return GetLocalInt(GetModule(),"m_bGameStarted");
}

//////////////////////////////////////////////////////////////
// StartGame()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Starts the game.
//////////////////////////////////////////////////////////////
void StartGame()
{
    object oPlayer;
    int nMapIndex;
    event evStartGame;

    if ( GetGameOption(OPTION_RANDOM_START_LOC) == TRUE )
    {
        RandomizeTeamStartLocations();
    }

    // Turn off the game pending flag
    SetLocalInt(GetModule(),"m_bGamePending",FALSE);

    nMapIndex = GetActiveBattleMap();

    // Start checking to see if the players have
    // all entered the arena.
    evStartGame = EventUserDefined(EVENT_ACTIVATE_GAME);
    SignalEvent(GetModule(),evStartGame);

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        if ( GetPlayerCheckedIn(oPlayer) == TRUE )
        {
            MovePlayerToGameStartLocation(nMapIndex,oPlayer);
        }

        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// EndTheGame()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/12/02
// Description: Ends the game and resets the levers locking
//              the teams.
//////////////////////////////////////////////////////////////
void EndTheGame()
{
    int nCount;
    string sAreaTag;
    object oArea;

    PrintString("Game Ended.");

    SetGameStarted(FALSE);

    // Signal an event to each team's HQ to unlock the
    // levers.
    for ( nCount = 0; nCount < GetMaxTeams(); nCount++ )
    {
        sAreaTag = "Team_" + IntToString(nCount) + "_HQ";
        oArea = GetObjectByTag(sAreaTag);

        if ( GetIsObjectValid(oArea) == TRUE )
        {
            SignalEvent(oArea,EventUserDefined(EVENT_UNLOCK_LEVER));
        }
    }

    UnlockAllTeams();
    CheckAllPlayersOut();

    IncrementNumGamesPlayed();
}

//////////////////////////////////////////////////////////////
// IncrementNumGamesPlayed()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/14/02
// Description: Increments the number of games played and
//              increments the active map if the number of
//              games played exceeds the specified amount.
//////////////////////////////////////////////////////////////
void IncrementNumGamesPlayed()
{
    int nNumGamesPlayed;

    nNumGamesPlayed = GetLocalInt(GetModule(),"m_nNumGamesPlayed");
    ++nNumGamesPlayed;

    if ( nNumGamesPlayed >= GetGameOption(OPTION_NUM_GAMES) )
    {
        if ( (GetActiveBattleMap() + 1) < GetNumMaps() )
        {
            SetActiveBattleMap(GetActiveBattleMap() + 1);
        }
        else
        {
            SetActiveBattleMap(0);
        }

        nNumGamesPlayed = 0;
    }

    SetLocalInt(GetModule(),"m_nNumGamesPlayed",nNumGamesPlayed);
}

//////////////////////////////////////////////////////////////
// RewardWinningTeam()
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 13 2002
// Description:
//////////////////////////////////////////////////////////////
void RewardWinningTeam(int nTeam)
{
    string sMessage = GetTeamName(nTeam) + " Team Wins!";
    PlaySound("as_cv_ta-da1");

    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC, sMessage);
        if ( GetPlayerTeam(oPC) == nTeam )
        {
            GiveGoldToCreature(oPC, 50 * GetHitDice(oPC) );
            AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_CHEER) );
        }
        else
        {
            GiveGoldToCreature(oPC, 25 * GetHitDice(oPC) );
            AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_CUSS) );
        }

        oPC = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// GetGameOption()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Starts the game.
//////////////////////////////////////////////////////////////
int GetGameOption( int nOption )
{
    if ( nOption == OPTION_ALLOWED_ITEM_COST )
    {
        return GetLocalInt(GetModule(),"m_nAllowedItemCost");
    }
    else if ( nOption == OPTION_ALLOWED_LEVEL )
    {
        return GetLocalInt(GetModule(),"m_nAllowedLevel");
    }
    else if ( nOption == OPTION_RANDOM_START_LOC )
    {
        return GetLocalInt(GetModule(),"m_bRandomStartLoc");
    }
    else if ( nOption == OPTION_NUM_TEAMS )
    {
        return GetLocalInt(GetModule(),"m_nNumTeams");
    }
    else if ( nOption == OPTION_NUM_GAMES )
    {
        return GetLocalInt(GetModule(),"m_nNumGames");
    }

    return 0;
}

//////////////////////////////////////////////////////////////
// SetGameOption()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Sets the game option.
//////////////////////////////////////////////////////////////
void SetGameOption( int nOption, int nOptionType )
{
    if ( nOption == OPTION_ALLOWED_ITEM_COST )
    {
        PrintString("Setting Game Option Allowed Cost To: " + IntToString(nOptionType));
        SetLocalInt(GetModule(),"m_nAllowedItemCost",nOptionType);
        BroadcastRuleChange(RULE_ALLOWED_COST,nOptionType);
    }
    else if ( nOption == OPTION_ALLOWED_LEVEL )
    {
        PrintString("Setting Game Option Allowed Level To: " + IntToString(nOptionType));
        SetLocalInt(GetModule(),"m_nAllowedLevel",nOptionType);
        BroadcastRuleChange(RULE_ALLOWED_LEVEL,nOptionType);
    }
    else if ( nOption == OPTION_RANDOM_START_LOC )
    {
        PrintString("Setting Game Option Randomized Start Locations To: " + IntToString(nOptionType));
        SetLocalInt(GetModule(),"m_bRandomStartLoc",nOptionType);
    }
    else if ( nOption == OPTION_NUM_TEAMS )
    {
        PrintString("Setting Game Option Num Teams To: " + IntToString(nOptionType));
        SetLocalInt(GetModule(),"m_nNumTeams",nOptionType);
        BroadcastRuleChange(RULE_NUM_TEAMS,nOptionType);
    }
    else if ( nOption == OPTION_NUM_GAMES )
    {
        PrintString("Setting Game Option Num Games To: " + IntToString(nOptionType));
        SetLocalInt(GetModule(),"m_nNumGames",nOptionType);
        BroadcastRuleChange(RULE_NUM_GAMES,nOptionType);
    }
}

//////////////////////////////////////////////////////////////
// GetGameStartLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Moves the player to the start location of the
//              currently active battlemap.
//////////////////////////////////////////////////////////////
location GetGameStartLocation( int nMapIndex, object oPlayer )
{
    object oArea, oWaypoint;
    string sSpawnTag;
    int nTeam;
    int nTeamSpawnIndex;
    location lStartLoc;

    nTeam = GetPlayerTeam(oPlayer);
    nTeamSpawnIndex = GetTeamData(nTeam,TEAM_START_LOC_INDEX);
    sSpawnTag = "Spawn" + IntToString(nTeamSpawnIndex);

    oArea = GetMapByIndex(nMapIndex);

    if ( GetIsObjectValid(oArea) == TRUE )
    {
        oWaypoint = GetFirstObjectInArea(oArea);
        while ( GetIsObjectValid(oWaypoint) == TRUE )
        {
            if ( GetObjectType(oWaypoint) == OBJECT_TYPE_WAYPOINT &&
                 GetTag(oWaypoint) == sSpawnTag )
            {
                lStartLoc = GetLocation(oWaypoint);
                return lStartLoc;
            }

            oWaypoint = GetNextObjectInArea(oArea);
        }
    }

    return lStartLoc;
}

//////////////////////////////////////////////////////////////
// MovePlayerToGameStartLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Moves the player to the start location of the
//              currently active battlemap.
//////////////////////////////////////////////////////////////
void MovePlayerToGameStartLocation( int nMapIndex, object oPlayer )
{
    location lStartLoc;
    object oPC;
    int nTeam;

    nTeam = GetPlayerTeam(oPlayer);
    oPC = GetFirstPC();
    while ( GetIsObjectValid(oPC) == TRUE )
    {
        if ( GetPlayerTeam(oPC) == nTeam )
        {
            SetPCLike(oPlayer,oPC);
            SetPCLike(oPC,oPlayer);
        }
        else
        {
            SetPCDislike(oPlayer,oPC);
            SetPCDislike(oPC,oPlayer);
        }

        oPC = GetNextPC();
    }

    lStartLoc = GetGameStartLocation(nMapIndex,oPlayer);
    AssignCommand(oPlayer,MoveMeToLocation(lStartLoc));
}

//////////////////////////////////////////////////////////////
// GetNumTeams()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Gets the number of teams in the game.
//////////////////////////////////////////////////////////////
int GetNumTeams()
{
    return GetGameOption(OPTION_NUM_TEAMS);
}

//////////////////////////////////////////////////////////////
// GetMaxTeams()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Gets the maximum number of teams.
//////////////////////////////////////////////////////////////
int GetMaxTeams()
{
    return DEFAULT_MAX_TEAMS;
}

//////////////////////////////////////////////////////////////
// SelectTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Selects a team for the player based on the
//              number of players on each team.
//////////////////////////////////////////////////////////////
void SelectTeam( object oPlayer )
{
    int nCount, nNumTeams, nMinTeam;
    int nNumPlayers, nMinPlayers;

    nMinTeam = -1;
    nMinPlayers = 100;

    nNumTeams = GetNumTeams();

    for ( nCount = 0; nCount < nNumTeams; nCount++ )
    {
        nNumPlayers = GetTeamData(nCount,TEAM_NUM_PLAYERS);

        if ( nNumPlayers < nMinPlayers )
        {
            nMinPlayers = nNumPlayers;
            nMinTeam = nCount;
        }
    }

    AddPlayerToTeam(nMinTeam,oPlayer);
}

//////////////////////////////////////////////////////////////
// RandomizeTeamStartLocations()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/11/02
// Description: Randomizes all the team start locations.
//////////////////////////////////////////////////////////////
void RandomizeTeamStartLocations()
{
    int nCount, nTeamIndex;
    int bIndexUsed;
    int nStartIndex;

    for ( nCount = 0; nCount < GetMaxTeams(); nCount++ )
    {
        SetTeamData(nCount,TEAM_START_LOC_INDEX,-1);
    }

    nCount = 0;
    while ( nCount < GetMaxTeams() )
    {
        nStartIndex = Random(GetMaxTeams());

        bIndexUsed = FALSE;
        for ( nTeamIndex = 0; nTeamIndex < GetMaxTeams(); nTeamIndex++ )
        {
            if ( GetTeamData(nTeamIndex,TEAM_START_LOC_INDEX) == nStartIndex )
            {
                bIndexUsed = TRUE;
            }
        }

        if ( bIndexUsed == FALSE )
        {
            SetTeamData(nCount,TEAM_START_LOC_INDEX,nStartIndex);
            nCount++;
        }
    }
}

//////////////////////////////////////////////////////////////
// GetTeamStartLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Returns the location of the starting waypoint
//              in pre-arena area.
//////////////////////////////////////////////////////////////
location GetTeamStartLocation( object oPlayer )
{
    int nTeam;
    string sWaypointTag;
    object oWaypoint;

    nTeam = GetPlayerTeam(oPlayer);

    sWaypointTag = "WP_" + IntToString(nTeam) + "_Start";

    oWaypoint = GetObjectByTag( sWaypointTag );
    return GetLocation(oWaypoint);
}

//////////////////////////////////////////////////////////////
// AddPlayerToTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Adds a player to the specified team.
//////////////////////////////////////////////////////////////
void AddPlayerToTeam( int nTeam, object oPlayer )
{
    int nNumPlayers, nCount;
    string sAreaTag;
    object oArea;

    nNumPlayers = GetTeamData(nTeam,TEAM_NUM_PLAYERS);

    SetLocalInt(oPlayer,"m_nTeam",nTeam);

    SetTeamData(nTeam,TEAM_NUM_PLAYERS,nNumPlayers + 1);

    // Signal an event to each team's HQ to add a counter
    // for the number of players on a team.
    for ( nCount = 0; nCount < GetMaxTeams(); nCount++ )
    {
        sAreaTag = "Team_" + IntToString(nCount) + "_HQ";
        oArea = GetObjectByTag(sAreaTag);

        if ( GetIsObjectValid(oArea) == TRUE )
        {
            SignalEvent(oArea,EventUserDefined(EVENT_ADD_PLAYER_TO_TEAM + nTeam));
        }
    }

    // Loop through all other players in the game
    // and set up the likes/dislikes appropriately.
    object oPC;

    oPC = GetFirstPC();
    while ( GetIsObjectValid(oPC) == TRUE )
    {
        if ( oPC != oPlayer )
        {
            if ( GetPlayerTeam(oPC) == nTeam )
            {
                SetPCLike(oPlayer,oPC);
                SetPCLike(oPC,oPlayer);
            }
            else
            {
                SetPCDislike(oPlayer,oPC);
                SetPCDislike(oPC,oPlayer);
            }
        }

        oPC = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// RemovePlayerFromTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Removes a player to the specified team.
//////////////////////////////////////////////////////////////
void RemovePlayerFromTeam( int nTeam, object oPlayer )
{
    int nNumPlayers, nCount;
    string sAreaTag;
    object oArea;

    SetLocalInt(oPlayer,"m_nTeam",-1);

    nNumPlayers = GetTeamData(nTeam,TEAM_NUM_PLAYERS);
    SetTeamData(nTeam,TEAM_NUM_PLAYERS,nNumPlayers - 1);

    // Signal an event to each team's HQ to remove a counter
    // for the number of players on a team.
    for ( nCount = 0; nCount < GetMaxTeams(); nCount++ )
    {
        sAreaTag = "Team_" + IntToString(nCount) + "_HQ";
        oArea = GetObjectByTag(sAreaTag);

        if ( GetIsObjectValid(oArea) == TRUE )
        {
            SignalEvent(oArea,EventUserDefined(EVENT_REMOVE_PLAYER_FROM_TEAM + nTeam));
        }
    }
}

//////////////////////////////////////////////////////////////
// GetPlayerTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Returns the team of the specified player.
//////////////////////////////////////////////////////////////
int GetPlayerTeam( object oPlayer )
{
    return GetLocalInt(oPlayer,"m_nTeam");
}

//////////////////////////////////////////////////////////////
// UnlockAllTeams()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/13/02
// Descriptin: Unlocks all the teams.
//////////////////////////////////////////////////////////////
void UnlockAllTeams()
{
    int nCount;

    for ( nCount = 0; nCount < GetNumTeams(); nCount++ )
    {
        SetTeamLocked(nCount,FALSE);
    }
}

//////////////////////////////////////////////////////////////
// SetTeamLocked()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Locks the specified team.
//////////////////////////////////////////////////////////////
void SetTeamLocked( int nTeam, int bLocked )
{
    SetTeamData(nTeam,TEAM_LOCKED_STATE,bLocked);
    BroadcastTeamLockedState(nTeam,bLocked);

    if ( bLocked == TRUE )
    {
        PrintString("Team: " + GetTeamName(nTeam) + " is now locked.");
        IncrementNumLockedTeams();
    }
    else
    {
        PrintString("Team: " + GetTeamName(nTeam) + " is now unlocked.");
        DecrementNumLockedTeams();
    }
}

//////////////////////////////////////////////////////////////
// GetTeamLocked()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Locks the specified team.
//////////////////////////////////////////////////////////////
int GetTeamLocked( int nTeam )
{
    return GetTeamData(nTeam,TEAM_LOCKED_STATE);
}

//////////////////////////////////////////////////////////////
// BroadcastTeamLockedState()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Broadcasts a message to all players on a
//              specific team that the team has been set to
//              the specified lock state.
//////////////////////////////////////////////////////////////
void BroadcastTeamLockedState( int nTeam, int bLocked )
{
    object oPlayer;
    string sLockedMessage;

    if ( bLocked == TRUE )
    {
        sLockedMessage = "Your team has been locked. It is no longer possible to check in.";
    }
    else
    {
        sLockedMessage = "Your team has been un-locked. It is once again possible to check in.";
    }

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        if ( GetPlayerTeam(oPlayer) == nTeam )
        {
            SendMessageToPC(oPlayer,sLockedMessage);
        }

        oPlayer = GetNextPC();
    }
}

//////////////////////////////////////////////////////////////
// ApplyLockedEffect()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Applies the locked visual effect to the
//              lever position.
//////////////////////////////////////////////////////////////
void ApplyLockedEffect( object oLever )
{
    string sEffectTemplate;
    sEffectTemplate = "coc_locked";

    CreateObject(OBJECT_TYPE_PLACEABLE,sEffectTemplate,GetLocation(oLever));
}

//////////////////////////////////////////////////////////////
// RemoveLockedEffect()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Removes the locked visual effect at the
//              lever position.
//////////////////////////////////////////////////////////////
void RemoveLockedEffect( object oLever )
{
    object oLockedEffect;
    string sEffectTagName;
    sEffectTagName = "coc_locked";

    oLockedEffect = GetNearestObjectByTag(sEffectTagName,oLever);
    DestroyObject(oLockedEffect);
}

//////////////////////////////////////////////////////////////
// SetTeamData()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Sets a particular type of data in the team
//              data data structure.
//////////////////////////////////////////////////////////////
void SetTeamData( int nTeam, int nDataType, int nData )
{
    string sTeamVarName;

    sTeamVarName = "m_nTeam" + IntToString(nTeam);

    if ( nDataType == TEAM_NUM_PLAYERS )
    {
        sTeamVarName += "NumPlayers";
        SetLocalInt(GetModule(),sTeamVarName,nData);
    }
    else if ( nDataType == TEAM_LOCKED_STATE )
    {
        sTeamVarName += "Locked";
        SetLocalInt(GetModule(),sTeamVarName,nData);
    }
    else if ( nDataType == TEAM_START_LOC_INDEX )
    {
        sTeamVarName += "StartIndex";
        SetLocalInt(GetModule(),sTeamVarName,nData);
    }
}

//////////////////////////////////////////////////////////////
// GetTeamData()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Selects a team for the player based on the
//              number of players on each team.
//////////////////////////////////////////////////////////////
int GetTeamData( int nTeam, int nDataType )
{
    string sTeamVarName;

    sTeamVarName = "m_nTeam" + IntToString(nTeam);

    if ( nDataType == TEAM_NUM_PLAYERS )
    {
        sTeamVarName += "NumPlayers";
        return GetLocalInt(GetModule(),sTeamVarName);
    }
    else if ( nDataType == TEAM_LOCKED_STATE )
    {
        sTeamVarName += "Locked";
        return GetLocalInt(GetModule(),sTeamVarName);
    }
    else if ( nDataType == TEAM_START_LOC_INDEX )
    {
        sTeamVarName += "StartIndex";
        return GetLocalInt(GetModule(),sTeamVarName);
    }

    return 0;
}

//////////////////////////////////////////////////////////////
// ApplyObserverModeEffects()
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 12, 2002
// Description: Applies the effects needed to place this player
//              in observer mode.
//////////////////////////////////////////////////////////////
void ApplyObserverModeEffects(object oPlayer)
{
    if ( GetGameStarted() == TRUE )
    {
        SetObserver(oPlayer, TRUE);

        effect ePoly = EffectPolymorph(POLYMORPH_TYPE_PIXIE);

        effect eVis = EffectVisualEffect(VFX_DUR_INVISIBILITY);
        effect eHaste = EffectMovementSpeedIncrease(200);
        effect eAoe = EffectAreaOfEffect(AOE_PER_INVIS_SPHERE, "", "", "coc_end_observer");
        effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);

        effect eLink = EffectLinkEffects(eVis, eHaste);
        eLink = EffectLinkEffects(eLink, eAoe);
        eLink = EffectLinkEffects(eLink, eInvis);

        eLink = EffectLinkEffects(eLink, ePoly);

        int nStr = GetAbilityScore( oPlayer, ABILITY_STRENGTH);
        if (nStr > 10)
        {
            effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH, nStr-10);
            eLink = EffectLinkEffects(eLink, eStr);
        }

        effect eAttack = EffectAttackDecrease(10);
        eLink = EffectLinkEffects(eLink, eAttack);

        eLink = ExtraordinaryEffect(eLink);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPlayer);

        object oPC;

        oPC = GetFirstPC();
        while ( GetIsObjectValid(oPC) == TRUE )
        {
            SetPCLike(oPC,oPlayer);
            SetPCLike(oPlayer,oPC);

            oPC = GetNextPC();
        }
    }
}

//////////////////////////////////////////////////////////////
// GetIsObserver()
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 12, 2002
// Description: Is this player an observer?
//////////////////////////////////////////////////////////////
int GetIsObserver(object oPlayer)
{
    return GetLocalInt(oPlayer, OBSERVER_MODE);
}

//////////////////////////////////////////////////////////////
// SetObserver()
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 12, 2002
// Description: Set this player's observer state
//////////////////////////////////////////////////////////////
void SetObserver(object oPlayer, int nStatus)
{
    object oPC;
    int nTeam;

    SetLocalInt(oPlayer, OBSERVER_MODE, nStatus);

    if ( nStatus == TRUE )
    {
        oPC = GetFirstPC();
        while ( GetIsObjectValid(oPC) == TRUE )
        {
            SetPCLike(oPC,oPlayer);
            SetPCLike(oPlayer,oPC);

            oPC = GetNextPC();
        }
    }
    else
    {
        nTeam = GetPlayerTeam(oPlayer);
        oPC = GetFirstPC();
        while ( GetIsObjectValid(oPC) == TRUE )
        {
            if ( GetPlayerTeam(oPC) == nTeam )
            {
                SetPCLike(oPC,oPlayer);
                SetPCLike(oPlayer,oPC);
            }
            else
            {
                SetPCDislike(oPC,oPlayer);
                SetPCDislike(oPlayer,oPC);
            }

            oPC = GetNextPC();
        }
    }
}

//////////////////////////////////////////////////////////////
// GetTeamName()
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 13, 2002
// Description: Returns a string containing the team's name
//////////////////////////////////////////////////////////////
string GetTeamName(int nTeam)
{
    if (nTeam == TEAM_BLUE)
    {
        return "Blue";
    }
    if (nTeam == TEAM_RED)
    {
        return "Red";
    }
    if (nTeam == TEAM_GOLD)
    {
        return "Gold";
    }
    if (nTeam == TEAM_PURPLE)
    {
        return "Purple";
    }
    return "";
}
