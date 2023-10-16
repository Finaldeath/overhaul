// Crimson's custom AI

#include "nw_i0_generic"

void MoveAway(object oIntruder);

void DoVoiceChat()
{
    int nRand = Random(20);
    int nVoice = -1;
    if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
    else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
    else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
    else if(nRand == 3) nVoice = VOICE_CHAT_TAUNT;
    else if(nRand == 4) nVoice = VOICE_CHAT_LAUGH;

    if(nVoice != -1)
        PlayVoiceChat(nVoice, OBJECT_SELF);
}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF, "X2_NW_I0_GENERIC_INTRUDER");

    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();
    if (GetIsDead(oIntruder) == TRUE)
        return;

    if (__InCombatRound() == TRUE)
    {
        return;
    }

    __TurnCombatRoundOn(TRUE);

    /*

    */
    DoVoiceChat();
    object oRight = GetItemPossessedBy(OBJECT_SELF, "qx_bloodsucker");
    object oLeft = GetItemPossessedBy(OBJECT_SELF, "qx_sting");
    int nIsDual = FALSE;
    if(GetItemInSlot(INVENTORY_SLOT_LEFTHAND) == oLeft)
        nIsDual = TRUE;


    /*
    - First, run away from intruder and attack with ranged weapon.
    - If wounded -> use talent heal
    - If an enemy comes into close range:
    - 50% to use melee weapons (for 2-3 rounds)
    - 50% to cast improved invisibilty and run away to use ranged weapon.
    */
    if(GetLocalInt(OBJECT_SELF, "FIRST_RUN") == 0)
    {
        SetLocalInt(OBJECT_SELF, "FIRST_RUN", 1);
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_IMPROVED_INVISIBILITY, OBJECT_SELF);
        MoveAway(oIntruder);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
    if(fHP < 0.5)
    {
        if(TalentHealingSelf())
        {
             __TurnCombatRoundOn(FALSE);
            return;
        }
    }
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    float fDistance = GetDistanceBetween(OBJECT_SELF, oEnemy);
    if(fDistance <= 10.0)
    {
        int nRand = Random(100) + 1;
        if(nRand <= 50) // melee
        {
            if(!nIsDual)
            {
                ClearAllActions();
                ActionEquipItem(oLeft, INVENTORY_SLOT_LEFTHAND);
                ActionEquipItem(oRight, INVENTORY_SLOT_RIGHTHAND);
            }
            //bkEquipMelee(oIntruder, TRUE);
            ActionAttack(oIntruder);
        }
        else // run away
        {
            int bHasEffect = (GetHasSpellEffect(SPELL_IMPROVED_INVISIBILITY) || GetHasSpellEffect(SPELL_INVISIBILITY));
            if(GetHasSpell(SPELL_IMPROVED_INVISIBILITY))
            {
                ClearAllActions();
                AssignCommand(oIntruder, ClearAllActions());
                if(!bHasEffect)
                    ActionCastSpellAtObject(SPELL_IMPROVED_INVISIBILITY, OBJECT_SELF);
                DelayCommand(3.0, SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, TRUE));
                MoveAway(oIntruder);
            }
            else if(GetHasSpell(SPELL_INVISIBILITY))
            {
                ClearAllActions();
                if(!bHasEffect)
                    ActionCastSpellAtObject(SPELL_INVISIBILITY, OBJECT_SELF);
                DelayCommand(3.0, SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, TRUE));
                MoveAway(oIntruder);
            }
            else if(GetHasSpell(SPELL_DARKNESS))
            {

                ClearAllActions();
                if(!bHasEffect)
                    ActionCastSpellAtObject(SPELL_DARKNESS, oIntruder);
                DelayCommand(3.0, SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, TRUE));
                MoveAway(oIntruder);
            }
            else
            {
                ClearAllActions();
                MoveAway(oIntruder);
            }
        }
    }
    else // target far away
        ActionAttack(oIntruder);




    __TurnCombatRoundOn(FALSE);

}

void MoveAway(object oIntruder)
{
    effect eGhost = EffectCutsceneGhost(); // used to avoid bumping into creatures when running away
    object oWP = GetNearestObjectByTag("qx_wp_crimson", OBJECT_SELF, 3);
    bkEquipRanged(OBJECT_SELF, FALSE, TRUE);
    if(oWP != OBJECT_INVALID)
        ActionMoveToObject(oWP, TRUE);
    else
        ActionMoveAwayFromObject(oIntruder, TRUE, 20.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, OBJECT_SELF, 5.0);
    ActionDoCommand(SetFacingPoint(GetPosition(oIntruder)));
    ActionAttack(oIntruder);
}
