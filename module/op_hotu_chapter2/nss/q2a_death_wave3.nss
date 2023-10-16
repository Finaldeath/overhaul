//:: q2a_death_wave3
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

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
            return;


    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    //Do not count if the PC is on the Betrayal path - no reinforcements for him
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;


    object oBattleMaster = GetObjectByTag("q2abattle2master");
    SetLocalInt(oBattleMaster, "Battle2Wave3Dead", GetLocalInt(oBattleMaster, "Battle2Wave3Dead") + 1);

    //SendMessageToPC(GetFirstPC(), "Total Dead WAVE 3: " + IntToString(GetLocalInt(oBattleMaster, "Battle2Wave3Dead")));
    if (GetLocalInt(oBattleMaster, "Battle2Wave3Dead") == 6)
    {
        //SendMessageToPC(GetFirstPC(), "Signal Sent");
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE_WAVE3));
    }
    else if (GetLocalInt(oBattleMaster, "Battle2Wave3Dead") == 12)
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE_WAVE3));
    else if (GetLocalInt(oBattleMaster, "Battle2Wave3Dead") >= 27) //27 total creatures in wave 3
    {
        //SendMessageToPC(GetFirstPC(), "PC VICTORY IN BATTLE 2 - Signal Retreat");
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_WAVE3_RETREAT));
        SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_PLAYER_WAVE3_VICTORY));
    }


}


