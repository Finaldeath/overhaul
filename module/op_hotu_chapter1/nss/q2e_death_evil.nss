//::///////////////////////////////////////////////
//:: Default:On Death
//:: NW_C2_DEFAULT7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 25, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
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

    if (GetLocalInt(OBJECT_SELF, "nCounted") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nCounted", 1);
        SetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT", GetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT") + 1);
        //If I was killed by a creature from one of the other thrones...
        //If that creatures controller is sitting on that same throne,
        //he gets 2000 xp.
        object oKiller = GetLastKiller();
        //find out if the killing creature's owner is sitting on the killing creatures throne
        if(GetName(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1)))) == GetLocalString(oKiller, "szOwner"))
        {
            object oPC = GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1)));
            if (GetPCTotalLevel(oPC) < 15)
            {
                Reward_2daXP(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1))), XP_EPIC, FALSE);
            }
            else
            {
                Reward_2daXP(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1))), XP_VERY_HIGH, FALSE);

            }

        }
    }
}
