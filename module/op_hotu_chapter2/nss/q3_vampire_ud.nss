//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetLocalInt(OBJECT_SELF, "ALARM") == 1 && !GetIsInCombat(OBJECT_SELF))
        {
            object oWP = GetWaypointByTag("q3b_wp_alarm");
            ClearAllActions();
            ActionMoveToObject(oWP, TRUE, 7.0);
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        int nRand = Random(12);
        int nVoice;
        if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
        else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
        else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
        else if(nRand == 3) nVoice =  VOICE_CHAT_TAUNT;
        PlayVoiceChat(nVoice, OBJECT_SELF);

        object oWP = GetNearestObjectByTag("q3c_wp_heal");
        float fDistance = GetDistanceBetween(oWP, OBJECT_SELF);
        if(fDistance > 20.0 || fDistance < 3.0)
            return;

        object oPC = GetLastDamager();
        float fCurHP = IntToFloat(GetCurrentHitPoints());
        float fMaxHP = IntToFloat(GetMaxHitPoints());
        int nHealed = GetLocalInt(OBJECT_SELF, "HEALED");
        if((fCurHP / fMaxHP) <= 0.7 && nHealed == 0)
        {
            SetLocalInt(OBJECT_SELF, "HEALDED", 1);
            ClearAllActions();
            //ActionMoveAwayFromObject(oPC, TRUE);
            ActionMoveToObject(oWP, TRUE, 0.0);
            ActionDoCommand(DetermineCombatRound(oPC));
            ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
            SetCommandable(FALSE, OBJECT_SELF);
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {
        PlayVoiceChat(VOICE_CHAT_THREATEN, OBJECT_SELF);
    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
        //DestroyObject(OBJECT_SELF, 0.3);
        int nCoffin = GetLocalInt(OBJECT_SELF, "COFFIN");
        if(GetTag(OBJECT_SELF) == "q3_CultElderMonk")
            nCoffin = 9;

        if(nCoffin > 0)
        {
            object oCoffin = GetObjectByTag("q3c_coffin" + IntToString(nCoffin));
            SignalEvent(oCoffin, EventUserDefined(101));
            SetLocalLocation(GetArea(OBJECT_SELF), "GAS_LOC", GetLocation(OBJECT_SELF));
            SetLocalLocation(GetArea(OBJECT_SELF), "GAS_TARGET", GetLocation(oCoffin));
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102)); // create a gaseous form
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }


}


