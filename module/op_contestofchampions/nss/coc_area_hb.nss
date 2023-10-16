#include "inc_module"

void RemoveAllPlayers()
{
    effect eHeal, eRes;
    object oPC;
    object oGameArea;
    int nActiveMapIndex;

    nActiveMapIndex = GetActiveBattleMap();
    oGameArea = GetMapByIndex(nActiveMapIndex);

    oPC = GetFirstPC();
    while ( GetIsObjectValid(oPC) )
    {
        if ( GetArea(oPC) == oGameArea )
        {
            CheckPlayerOut(oPC);
            if ( GetCurrentHitPoints(oPC) <= GetMaxHitPoints() )
            {
                if ( GetCurrentHitPoints(oPC) <= 0 )
                {
                    eRes = EffectResurrection();
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eRes,oPC);
                }

                eHeal = EffectHeal(GetMaxHitPoints(oPC));
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oPC);
            }

            MovePlayerToStartLocation( oPC );
        }

        oPC = GetNextPC();
    }
}

void main()
{
    int bActiveArena = FALSE;

    // We don't even want to be in this loop if the
    // game hasn't started yet...
    if ( GetGameStarted() == FALSE )
    {
        return;
    }

    if ( GetMapByIndex(GetActiveBattleMap()) == OBJECT_SELF )
    {
        bActiveArena = TRUE;
    }

    int nTeamCount_0 = 0;
    int nTeamCount_1 = 0;
    int nTeamCount_2 = 0;
    int nTeamCount_3 = 0;

    object oPC;
    oPC = GetFirstPC();
    while ( GetIsObjectValid(oPC) == TRUE )
    {
        if ( GetIsObserver(oPC) == FALSE &&
             GetArea(oPC) == OBJECT_SELF )
        {
            switch ( GetPlayerTeam(oPC) )
            {
                case 0: // BLUE
                    {
                        PrintString("Blue Player Found: " + GetName(oPC));
                        ++nTeamCount_0;
                    }
                    break;

                case 1: // RED
                    {
                        PrintString("Red Player Found: " + GetName(oPC));
                        ++nTeamCount_1;
                    }
                    break;

                case 2: // GOLD
                    {
                        PrintString("Gold Player Found: " + GetName(oPC));
                        ++nTeamCount_2;
                    }
                    break;

                case 3: // PURPLE
                    {
                        PrintString("Purple Player Found: " + GetName(oPC));
                        ++nTeamCount_3;
                    }
                    break;
            }
        }

        oPC = GetNextPC();
    }

    if ( bActiveArena == TRUE )
    {
        int nActiveTeams = 0;

        if ( nTeamCount_0 > 0 )
        {
            ++nActiveTeams;
        }

        if ( nTeamCount_1 > 0 )
        {
            ++nActiveTeams;
        }

        if ( nTeamCount_2 > 0 )
        {
            ++nActiveTeams;
        }

        if ( nTeamCount_3 > 0 )
        {
            ++nActiveTeams;
        }

        if ( nActiveTeams == 1 )
        {
            PrintString("End Condition: 1 Active Team.");
            PrintString("Active Map: " + IntToString(GetActiveBattleMap()));

            // win condition!
            int nWinningTeam = -1;
            if (nTeamCount_0 > 0)
            {
                nWinningTeam = TEAM_BLUE;
            }
            else if (nTeamCount_1 > 0)
            {
                nWinningTeam = TEAM_RED;
            }
            else if (nTeamCount_2 > 0)
            {
                nWinningTeam = TEAM_GOLD;
            }
            else if (nTeamCount_3 > 0)
            {
                nWinningTeam = TEAM_PURPLE;
            }

            RemoveAllPlayers();
            RewardWinningTeam(nWinningTeam);

            // Set the game ended so that this loop will
            // no longer function. Instead, we're handing
            // off responsibility to the module to make sure
            // that everyone is moved out of the active map.
            SetGameStarted(FALSE);

            // Start checking to see if the players have
            // all exited the arena.
            event evEndGame;
            evEndGame = EventUserDefined(EVENT_DEACTIVATE_GAME);
            SignalEvent(GetModule(),evEndGame);
        }
        else if ( nActiveTeams == 0 )
        {
            PrintString("End Condition: 0 Active Teams.");
            PrintString("Active Map: " + IntToString(GetActiveBattleMap()));

            // whoops. somehow they managed to tie!
            // need to give feedback!
            RemoveAllPlayers();
            RewardWinningTeam(-1);

            // Set the game ended so that this loop will
            // no longer function. Instead, we're handing
            // off responsibility to the module to make sure
            // that everyone is moved out of the active map.
            SetGameStarted(FALSE);

            // Start checking to see if the players have
            // all exited the arena.
            event evEndGame;
            evEndGame = EventUserDefined(EVENT_DEACTIVATE_GAME);
            SignalEvent(GetModule(),evEndGame);
        }
    }
}
