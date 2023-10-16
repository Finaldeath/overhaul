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
