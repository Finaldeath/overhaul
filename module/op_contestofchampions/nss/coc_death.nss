#include "inc_module"

//////////////////////////////////////////////////////////////
// inc_module :: This file is run when the player dies
//////////////////////////////////////////////////////////////
// Created By: Noel Borstad
// Created On: June 12, 2002
//////////////////////////////////////////////////////////////

void main()
{
    object oPC = GetLastPlayerDied();
    /*
    object oKiller = GetLastHostileActor(oPC);
    if ( GetMaster(oKiller) != OBJECT_INVALID )
    {
        oKiller = GetMaster(oKiller);
    }

    if (GetIsObjectValid(oKiller))
    {
        if ( GetIsPC(oKiller) )
        {
            SendMessageToPC(oKiller, "You killed " + GetName(oPC) + "!");
            GiveGoldToCreature(oKiller, 20 * GetHitDice(oPC) );
        }

        SendMessageToPC(oPC, "You were killed by " + GetName(oKiller) );
    }
    */

    RemoveAllEffects(oPC);
    SetObserver(oPC, FALSE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal( GetMaxHitPoints(oPC) ), oPC);

    CheckPlayerOut(oPC);
    MovePlayerToStartLocation(oPC);
}
