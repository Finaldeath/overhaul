//:://////////////////////////////////////////////////
//:: q1_death_nathan
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x0_i0_spawncond"

void main()
{
    //int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    //int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);

    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
    //if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    //{
    object oKiller = GetLastHostileActor();
    if (GetIsPC(oKiller) == TRUE)
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 3);
        AdjustAlignment(oKiller, ALIGNMENT_CHAOTIC, 3);
        SetLocalInt(GetModule(), "X1_PCKilledNathan", 1);
    }

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }

    //Check to see if PC was on Rumgut Quest..

    if (GetLocalInt(oKiller, "NW_JOURNAL_ENTRYq1footrumgut") > 0)
        AddJournalQuestEntry("q1footrumgut", 70, oKiller);


}
