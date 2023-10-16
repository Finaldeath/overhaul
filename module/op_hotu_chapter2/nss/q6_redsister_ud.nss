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
#include "nw_i0_plot"


void PrepareSpells(int bInstant = FALSE)
{
    ClearAllActions();
    ActionCastSpellAtObject(SPELL_DIVINE_POWER, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    //ActionCastSpellAtObject(SPELL_PROTECTION_FROM_ELEMENTS, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    //ActionCastSpellAtObject(SPELL_SHIELD_OF_FAITH, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    ActionCastSpellAtObject(SPELL_DIVINE_FAVOR, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    //ActionCastSpellAtObject(SPELL_FREEDOM_OF_MOVEMENT, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    //ActionCastSpellAtObject(SPELL_MAGIC_VESTMENT, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
    ActionCastSpellAtObject(SPELL_OWLS_WISDOM, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, bInstant);
}

void Move()
{
    if(GetIsInCombat())
        return;
    string sTag = "q6_wp_alarm_" + GetTag(OBJECT_SELF);
    object oWP = GetObjectByTag(sTag);
    if(oWP != OBJECT_INVALID)
    {
        ClearAllActions();
        ActionMoveToObject(oWP, TRUE, 0.0);
        bkEquipRanged();
    }
}

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {
        if(GetTag(OBJECT_SELF) == "q6_sabal1" || GetTag(OBJECT_SELF) == "q6_sabal")
        {
            if(GetIsInCombat())
            {
                int nRand = Random(14);
                int nVoice;
                if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
                else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
                else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
                else if(nRand == 3) nVoice = VOICE_CHAT_TAUNT;
                else if(nRand == 4) nVoice = VOICE_CHAT_THREATEN;

                if(nRand <= 4)
                    PlayVoiceChat(nVoice);

            }
        }
    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {
        if((GetTag(OBJECT_SELF) == "q6_sabal1" || GetTag(OBJECT_SELF) == "q6_sabal")
            && GetTag(GetArea(OBJECT_SELF)) != "q6f2_ThroneRoom")
        {
            // if sabal is 50% or less -> she escapes
            int nCurrent = GetCurrentHitPoints();
            int nMax = GetMaxHitPoints();
            if(IntToFloat(nCurrent) / IntToFloat(nMax) <= 0.5)
            {
                int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SABAL_ESCAPE_ONCE");
                if(nDoOnce == 1)
                    return;
                SetLocalInt(OBJECT_SELF, "DO_SABAL_ESCAPE_ONCE", 1);
                ClearAllActions();

                // First apply a time stop to draw player's attention
                effect eTimeStop = EffectTimeStop();
                effect eVis = EffectVisualEffect(VFX_FNF_TIME_STOP);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
                DelayCommand(0.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTimeStop, OBJECT_SELF, 5.0));
                DelayCommand(1.0, PlayVoiceChat(VOICE_CHAT_LAUGH));
                DelayCommand(1.0, PlaySpeakSoundByStrRef(101130));
                DelayCommand(1.0, SendMessageToPCByStrRef(GetFirstPC(), 101131));
                DelayCommand(2.0, ActionCastFakeSpellAtObject(SPELL_GATE, OBJECT_SELF));
                eVis = EffectVisualEffect(472);
                DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
                DestroyObject(OBJECT_SELF, 5.2);
            }
            else if(nCurrent == 1) // failsafe
            {
                effect eVis = EffectVisualEffect(472);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
                DestroyObject(OBJECT_SELF);
            }
        }
    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {

    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }
    else if(nUser == 101) // alarm at camp
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CAMP_ALARM_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_CAMP_ALARM_ONCE", 1);
        if(GetSkillRank(SKILL_HIDE) >= 4)
        {
            ClearAllActions();
            ActionUseSkill(SKILL_HIDE, OBJECT_SELF);

        }
        Move();
        DelayCommand(2.0, PrepareSpells());

    }
    else if(nUser == 102) // ambush
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AMBUSH1_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_AMBUSH1_ONCE", 1);
        //PrepareSpells(TRUE);
        if(GetTag(OBJECT_SELF) == "q6_sabal")
        {
            SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "q6ai_sabal");
            ActionDoCommand(DetermineCombatRound());
            //object oDark1 = GetWaypointByTag("q6b_wp_darkness1");
            //object oDark2 = GetWaypointByTag("q6b_wp_darkness2");
            //ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oDark1), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
            //ActionCastSpellAtLocation(SPELL_DARKNESS, GetLocation(oDark2), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        }
        else
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
            ActionAttack(oEnemy);
            ActionAttack(oEnemy);
            ActionAttack(oEnemy);
        }


    }


}


