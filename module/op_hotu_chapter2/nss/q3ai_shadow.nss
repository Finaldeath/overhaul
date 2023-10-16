#include "nw_i0_generic"

// Return TRUE if wounded below fLevel
int GetWounded(float fLevel)
{
    float fMax = IntToFloat(GetMaxHitPoints(OBJECT_SELF));
    float fCur = IntToFloat(GetCurrentHitPoints(OBJECT_SELF));

    return ((fMax / fCur) < fLevel);
}

// returns TRUE if there is an enemy with a melee weapon closer than fRange
int GetThreat(float fRange)
{
    int i = 1;
    object oEnemy = GetNearestPerceivedEnemy(OBJECT_SELF, i);
    float fDistance = GetDistanceBetween(OBJECT_SELF, oEnemy);
    if(fDistance != 0.0 && fDistance < fRange)
         return TRUE;
    return FALSE;
}

void AttackNearest()
{
    object oEnemy = GetNearestPerceivedEnemy();
    if(oEnemy != OBJECT_INVALID)
        ActionAttack(oEnemy);
    else
        ClearAllActions();
}

void DoVoiceChat()
{
    int nRand = Random(12);
    int nVoice;
    if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
    else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
    else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
    else if(nRand == 3) nVoice = VOICE_CHAT_LAUGH;
    else if(nRand == 4) nVoice = VOICE_CHAT_TAUNT;
    PlayVoiceChat(nVoice, OBJECT_SELF);
}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    int nDiff = GetCombatDifficulty();
    SetLocalInt(OBJECT_SELF, "NW_L_COMBATDIFF", nDiff);
    effect eShadow = EffectCutsceneGhost(); // so he won't bump into creatures
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    DoVoiceChat();
    int nStatus = GetLocalInt(OBJECT_SELF, "STATUS");
    /*if(nStatus < 3)
    {
        bkEquipMelee(OBJECT_INVALID, FALSE);
        SetLocalInt(OBJECT_SELF, "STATUS", 3);
    }*/

    object oWP1 = GetWaypointByTag("q3c_wp_master_run1");
    object oWP2 = GetWaypointByTag("q3c_wp_master_run2");
    object oWP3 = GetWaypointByTag("q3c_wp_master_run3");
    object oWP4 = GetWaypointByTag("q3c_wp_master_run4");
    object oWP5 = GetWaypointByTag("q3c_wp_master_run5");

    if(nStatus == 0) // fighting in the first area
    {
        if(GetWounded(0.9) || GetThreat(11.0))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShadow, OBJECT_SELF, 10.0);
            SetLocalInt(OBJECT_SELF, "STATUS", 1); // Running to point oWP1, oWP2
            ClearAllActions();
            AssignCommand(oIntruder, ClearAllActions());
            DelayCommand(1.0, AssignCommand(oIntruder, ClearAllActions()));
            ActionMoveToObject(oWP1, TRUE);
            ActionMoveToObject(oWP2, TRUE);
            ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
            ActionDoCommand(SetFacingPoint(GetPosition(oWP1)));
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 2)); // Arrived to oWP2
            //ActionDoCommand(ClearAllActions());
            ActionDoCommand(AttackNearest());
            return;
        }
        ActionAttack(oIntruder);
        return;
    }
    else if(nStatus == 1) // Running to oWP2
    {
        ClearAllActions();
        ActionMoveToObject(oWP2, TRUE);
        ActionDoCommand(SetFacingPoint(GetPosition(oWP1)));
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 2)); // Arrived to oWP2
        //ActionDoCommand(ClearAllActions());
        ActionDoCommand(AttackNearest());
     }
    else if(nStatus == 2)// at oWP2
    {
        if(GetWounded(0.7) || GetThreat(11.0))
        {
            SetLocalInt(OBJECT_SELF, "STATUS", 3); // Running to oWP3
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShadow, OBJECT_SELF, 10.0);
            ClearAllActions();
            AssignCommand(oIntruder, ClearAllActions());
            DelayCommand(1.0, AssignCommand(oIntruder, ClearAllActions()));
            ActionMoveToObject(oWP3, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oWP2)));
            ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 4)); // Arrived to oWP3
            //ActionDoCommand(ClearAllActions());
            ActionDoCommand(AttackNearest());
            return;
        }
        oIntruder = GetNearestPerceivedEnemy();
        if(oIntruder == OBJECT_INVALID)
            return;
        float fDistance = GetDistanceBetween(OBJECT_SELF, oWP2);
        if(fDistance > 2.0)
        {
            ClearAllActions();
            ActionMoveToObject(oWP2, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oWP1)));
            ActionDoCommand(AttackNearest());
        }
        else
            ActionAttack(oIntruder);

        return;
    }
    else if(nStatus == 3) // Running to oWP3
    {
        ClearAllActions();
        ActionMoveToObject(oWP3, TRUE);
        ActionDoCommand(SetFacingPoint(GetPosition(oWP2)));
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 4)); // Arrived to oWP3
        //ActionDoCommand(ClearAllActions());
        ActionDoCommand(AttackNearest());
    }
    else if(nStatus == 4) // At oWP3
    {
        object oDoor = GetNearestObjectByTag("q3c_final_door");

        if(GetWounded(0.6) || GetThreat(8.0))
        {
            SetLocalInt(OBJECT_SELF, "STATUS", 5);
            bkEquipMelee(OBJECT_INVALID, FALSE);
            ClearAllActions();
            AssignCommand(oIntruder, ClearAllActions());
            DelayCommand(1.0, AssignCommand(oIntruder, ClearAllActions()));
            ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
            ActionMoveToObject(oWP4, TRUE);
            ActionMoveToObject(oWP5, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oWP4)));
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 6)); // Arrived to oWP4
            //ActionDoCommand(ClearAllActions());

        }
        oIntruder = GetNearestPerceivedEnemy();
        if(oIntruder == OBJECT_INVALID)
            return;
        ActionAttack(oIntruder);
        float fDistance = GetDistanceBetween(OBJECT_SELF, oWP3);
        if(fDistance > 2.0)
        {
            ClearAllActions();
            bkEquipMelee(OBJECT_INVALID, FALSE);
            ActionMoveToObject(oWP3, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oWP2)));

        }
    }
    else if(nStatus == 5) // on the way to oWP4
    {
        ClearAllActions();
        bkEquipMelee(OBJECT_INVALID, FALSE);
        ActionMoveToObject(oWP5, TRUE);
        ActionDoCommand(SetFacingPoint(GetPosition(oWP4)));
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 6)); // Arrived to oWP3
    }
    else if(nStatus == 6) // final area -> attack and hide
    {
        int nAttacked = GetLocalInt(OBJECT_SELF, "ATTACKED");
        float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);

        if(fDistance > 20.0)
        {
            return;
        }
        if(fDistance <= 5.0 && nAttacked == 0) // close to enemy and did not attack last round -> attack
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF, "ATTACKED", 1);
            ActionAttack(oIntruder);
            return;
        }
        if(nAttacked == 1) // Attacked last round -> move away from enemy
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF, "ATTACKED", 0);
            object oSneak = GetNearestObjectByTag("q3c_wp_sneak", OBJECT_SELF, 2);
            ActionMoveAwayFromObject(oIntruder, TRUE, 5.0);
            ActionMoveToObject(oSneak, TRUE);
            ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
            return;
        }
        if(fDistance > 5.0) // away from enemy -> move to enemy
        {
            ClearAllActions();
            bkEquipMelee(OBJECT_INVALID, FALSE);
            ActionMoveToObject(oIntruder, TRUE);
            ActionAttack(oIntruder);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "ATTACKED", 1));
            return;
        }

    }
}


