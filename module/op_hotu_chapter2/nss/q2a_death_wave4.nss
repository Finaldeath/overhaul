//:: q2a_death_wave4
/*
// Default On Death for attackers during wave 4
//
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

    //Depends on whether there were beholders, mindflayers or both
    int nTotalWave4Spawned = 0;
    if (GetGlobalInt("x2_plot_beholders_out") == 0)
    {
        nTotalWave4Spawned = 8;
    }
    if (GetGlobalInt("X2_Q2DOvermind") < 2)
    {
        nTotalWave4Spawned = nTotalWave4Spawned + 9;
    }

    object oBattleMaster = GetObjectByTag("q2abattle2master");
    SetLocalInt(oBattleMaster, "Battle2Wave4Dead", GetLocalInt(oBattleMaster, "Battle2Wave4Dead") + 1);

    //Retreat when all dead
    if (GetLocalInt(oBattleMaster, "Battle2Wave4Dead") >= nTotalWave4Spawned)
    {
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_WAVE4_RETREAT));
        SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_PLAYER_WAVE4_VICTORY));
    }


}


