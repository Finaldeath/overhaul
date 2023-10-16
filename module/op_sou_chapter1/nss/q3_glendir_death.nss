//::///////////////////////////////////////////////////
//:: X0_C2_DTH_CDECOR
//:: OnDeath handler
//:: Leave a decorative-only corpse (no name) that will never decay.
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/07/2002
//::///////////////////////////////////////////////////

#include "nw_i0_generic"
#include "x0_i0_corpses"

void main()
{
    //if Glendir was following the PC when he died - add the appropriate journal entry
    if (GetLocalInt(GetModule(), "X1_Q3GlendirFollowPC") == 1)
    {
        if (GetLocalInt(GetModule(), "q3_Glendir_Safe") != 1)
        {
            object oPC = GetLocalObject(OBJECT_SELF, "Q3_FOLLOW");
            AddJournalQuestEntry("Q3_JOURNAL_GLENDIR", 80, oPC);
        }
    }
    SetLocalInt(OBJECT_SELF, "q3_Glendir_Dead", 1);
    SetLocalInt(GetModule(), "q3_Glendir_Dead", 1);
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }

    // Leave a pretty, non-selectable corpse that will never decay
    KillAndReplaceDecorative(OBJECT_SELF);
}
