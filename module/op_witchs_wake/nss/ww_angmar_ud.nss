//::///////////////////////////////////////////////
//:: Witch Wake: Innocent, UserDefined
//:: WW_Innocent_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Paladins who kill this creature will fall.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

//A delayed function that allows for a hostility check. This prevents his
//anvil bashin from interfering with his anger at a door-bashing player.
void ClearAngmarActions(int nClearCombatState=FALSE)
{
    int bHostile = GetLocalInt(OBJECT_SELF, "bHostile");
    if (bHostile == FALSE)
    {
        ClearAllActions(nClearCombatState);
    }
}

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

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
            ClearAllActions(TRUE);
            BeginConversation();
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

        case 2001: //Custom User-Defined Event
        {
            //Check his state
            int bInConv = IsInConversation(OBJECT_SELF);
            int bInCombat = GetIsInCombat(OBJECT_SELF);
            int bHostile = GetLocalInt(OBJECT_SELF, "bHostile");

            //Check his proximity to his store.
            object oStore = GetObjectByTag("AngmarStore");
            float fDistance = GetDistanceToObject(oStore);

            //If he isn't in conversation or combat or angry at the player...
            if (bInConv == FALSE &&
                bInCombat == FALSE &&
                bHostile == FALSE)
            {
                //If far away, move him to the anvil.
                if (fDistance > 2.0)
                {
                    ActionForceMoveToObject(oStore);
                }
                //If close, make him bash his anvil.
                else
                {
                    object oAnvil = GetNearestObjectByTag("Anvil");
                    DoPlaceableObjectAction(oAnvil, PLACEABLE_ACTION_BASH);
                    DelayCommand(2.0, ClearAngmarActions(TRUE));
                }
            }
            //Re-signal event.
            DelayCommand(10.0, SignalEvent(OBJECT_SELF, EventUserDefined(2001)));
        }
        break;
    }
}
