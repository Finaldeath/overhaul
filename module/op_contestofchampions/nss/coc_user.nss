#include "inc_module"

void main()
{
    int nEventId;
    int nTimeRemaining;
    event evEvent;

    nEventId = GetUserDefinedEventNumber();

    PrintString("Module Event: " + IntToString(nEventId) + " received.");

    if ( nEventId >= EVENT_START_GAME &&
         nEventId < EVENT_ACTIVATE_GAME )
    {
        PrintString("Countdown event...");
        if ( GetLocalInt(OBJECT_SELF,"m_bCancelCountDown") == TRUE )
        {
            PrintString("Cancel countdown...");
            BroadcastCancelCountDown();
            DeleteLocalInt(OBJECT_SELF,"m_bCancelCountDown");
        }
        else
        {
            nTimeRemaining = (nEventId - EVENT_START_GAME) - 1;

            PrintString("Time Remaining: " + IntToString(nTimeRemaining));
            BroadcastCountDownTime(nTimeRemaining);
            //PlaySound("gui_button"); // this should be assigned to the levers

            if ( nTimeRemaining > 0 )
            {
                evEvent = EventUserDefined(nEventId - 1);
                DelayCommand(1.0f,SignalEvent(OBJECT_SELF,evEvent));
            }
            else
            {
                PrintString("Starting Game...");
                StartGame();
            }
        }
    }
    else if ( nEventId == EVENT_ACTIVATE_GAME )
    {
        int nActiveMap;
        object oMap;
        object oPC;
        int bPlayerNotInAreaYet = FALSE;

        PrintString("Activating Game");

        nActiveMap = GetActiveBattleMap();
        oMap = GetMapByIndex(nActiveMap);

        oPC = GetFirstPC();
        while ( GetIsObjectValid(oPC) == TRUE )
        {
            if ( GetPlayerCheckedIn(oPC) == TRUE &&
                 GetArea(oPC) != oMap )
            {
                // DEBUG
                if ( GetPlayerCheckedIn(oPC) == TRUE )
                {
                    PrintString("Player: " + GetName(oPC) + " is checked in.");
                }

                if ( GetArea(oPC) != oMap )
                {
                    PrintString("Player: " + GetName(oPC) + " is not in the active arena.");
                }

                bPlayerNotInAreaYet = TRUE;

                if ( GetArea(oPC) != OBJECT_INVALID )
                {
                    PrintString("Player: " + GetName(oPC) + " moving to active arena.");
                    MovePlayerToGameStartLocation(nActiveMap,oPC);
                }
            }

            oPC = GetNextPC();
        }

        if ( bPlayerNotInAreaYet == TRUE )
        {
            PrintString("Restarting Activate Area Check.");
            event evEvent;
            evEvent = EventUserDefined(nEventId);
            DelayCommand(1.0f,SignalEvent(GetModule(),evEvent));
        }
        else
        {
            PrintString("All players accounted for in active map. Starting Game.");
            SetGameStarted(TRUE);
        }
    }
    else if ( nEventId == EVENT_DEACTIVATE_GAME )
    {
        int nActiveMap;
        object oMap;
        object oPC;
        int bPlayerNotLeftAreaYet = FALSE;
        effect eRes, eHeal;

        PrintString("Deactivating Game");

        nActiveMap = GetActiveBattleMap();
        oMap = GetMapByIndex(nActiveMap);

        oPC = GetFirstPC();
        while ( GetIsObjectValid(oPC) == TRUE )
        {
            // If the player is checked in and
            // still in the active arena...
            if ( GetArea(oPC) == oMap )
            {
                // DEBUG
                if ( GetArea(oPC) == oMap )
                {
                    PrintString("Player: " + GetName(oPC) + " is still in the active arena.");
                }

                bPlayerNotLeftAreaYet = TRUE;

                if ( GetArea(oPC) != OBJECT_INVALID )
                {
                    PrintString("Player: " + GetName(oPC) + " moving to start location.");

                    // If the player is still checked in, check them out.
                    if ( GetPlayerCheckedIn(oPC) == TRUE )
                    {
                        CheckPlayerOut(oPC);
                    }

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

                    MovePlayerToStartLocation(oPC);
                }
            }

            oPC = GetNextPC();
        }

        if ( bPlayerNotLeftAreaYet == TRUE )
        {
            PrintString("Restarting Deactivate Area Check.");
            event evEvent;
            evEvent = EventUserDefined(nEventId);
            DelayCommand(1.0f,SignalEvent(GetModule(),evEvent));
        }
        else
        {
            PrintString("No players in active map. Ending Game.");
            EndTheGame();
        }
    }
}
