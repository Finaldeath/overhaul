//::///////////////////////////////////////////////
//:: Witchwork 1: Elkenherd User-Defined
//:: WW1_ElkHerd_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Run away OnConv if I have no Conversation.
     Random Walk on HB
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 14, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "ww1_inc_paladin"

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {
            int bCombat = GetIsInCombat();
            if (bCombat == FALSE)
            {
                ActionRandomWalk();
            }
        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            int bHaveConv = IsInConversation(OBJECT_SELF);

            if (bHaveConv == FALSE)
            {
                ActionMoveAwayFromObject(oPC, TRUE, 10.0);
                DelayCommand(5.0, ClearAllActions());
                DelayCommand(5.1, WalkWayPoints());
            }
        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {
            object oPC = GetLastKiller();
            PaladinFalls(oPC);
        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
