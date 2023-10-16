//:: q2a_death_wave2
/*
// Default On Death for attackers during wave 2
//if the leader dies - elect a new leader
+ */
//:://////////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: August 28/03
//:://////////////////////////////////////////////////
#include "q2_inc_battle"
#include "x2_inc_globals"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
            return;


    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    //Do not count if the PC is on the Betrayal path - no reinforcements for him
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;

    //How many have been spawned total in the wave (1 extra bone golem if the undead are in)
    int nWave2TotalSpawnCount = 31;

    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        nWave2TotalSpawnCount = 32;
    }

    object oBattleMaster = GetObjectByTag("q2abattle2master");
    SetLocalInt(oBattleMaster, "Battle2Wave2Dead", GetLocalInt(oBattleMaster, "Battle2Wave2Dead") + 1);

    //SendMessageToPC(GetFirstPC(), "Total Dead WAVE 2: " + IntToString(GetLocalInt(oBattleMaster, "Battle2Wave2Dead")));
    if (GetLocalInt(oBattleMaster, "Battle2Wave2Dead") == 7)
    {
        //SendMessageToPC(GetFirstPC(), "Signal Sent");
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE_WAVE2));
    }
    else if (GetLocalInt(oBattleMaster, "Battle2Wave2Dead") == 14)
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE_WAVE2));
    else if (GetLocalInt(oBattleMaster, "Battle2Wave2Dead") >= nWave2TotalSpawnCount)
    {
        //SendMessageToPC(GetFirstPC(), "PC VICTORY IN BATTLE 2 - Signal Retreat");
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_WAVE2_RETREAT));
        SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_PLAYER_WAVE2_VICTORY));

    }


}


