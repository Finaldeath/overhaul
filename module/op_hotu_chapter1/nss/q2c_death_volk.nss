//::///////////////////////////////////////////////
//:: Default:On Death
//:: NW_C2_DEFAULT7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed
    OVERRIDDEN FOR XP2! To allow for stat tracking (BK October 2 2002)
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 25, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void SetPlayerStats(object oKiller)
{
    int nKills = GetLocalInt(oKiller, "NW_L_PLAYER_KILLS");
    nKills = nKills + 1;
    SetLocalInt(oKiller, "NW_L_PLAYER_KILLS", nKills);
    float fCR =   GetLocalFloat(oKiller, "NW_L_PLAYER_TOUGHEST");
    // * this was tougher than any other creature the player killed
    if (GetChallengeRating(OBJECT_SELF) > fCR)
    {
        SetLocalFloat(oKiller, "NW_L_PLAYER_TOUGHEST", fCR);
        SetLocalString(oKiller, "NW_L_PLAYER_TOUGHEST_S", GetName(OBJECT_SELF));
    }
}

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();;
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }
    SetPlayerStats(oKiller);
    //****************
    //* Increment death local (whether this creature has died)
    SetLocalInt(GetModule(), "NW_G_DEATH_" + GetTag(OBJECT_SELF), GetLocalInt(GetModule(), "NW_G_DEATH_" + GetTag(OBJECT_SELF)) +1);
    // ***************
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    location lTarget = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_DIVINE), lTarget);
    FloatingTextStrRefOnCreature(84133 ,GetLastHostileActor());
    SetLocalInt(GetModule(), "NW_DJINNSTATE", 10);
}
