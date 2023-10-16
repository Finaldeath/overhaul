// Koth's custom AI

#include "nw_i0_generic"


int IsDifficult()
{
    return (GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT);
}

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

// Koth goes first against dangerous fighters
object GetEnemy()
{
    int i = 1;
    int nMaster;
    int nFighter;
    int nDefender;
    int nBarb;
    int nRanger;
    int nPaladin;
    int nChampion;
    int nBlack;
    int nTotal;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    while(oEnemy != OBJECT_INVALID)
    {

        nMaster = GetLevelByClass(CLASS_TYPE_WEAPON_MASTER, oEnemy);
        nFighter = GetLevelByClass(CLASS_TYPE_FIGHTER, oEnemy);
        nDefender = GetLevelByClass(CLASS_TYPE_DWARVENDEFENDER, oEnemy);
        nBarb = GetLevelByClass(CLASS_TYPE_BARBARIAN, oEnemy);
        nRanger = GetLevelByClass(CLASS_TYPE_RANGER, oEnemy);
        nPaladin = GetLevelByClass(CLASS_TYPE_PALADIN, oEnemy);
        nChampion = GetLevelByClass(CLASS_TYPE_DIVINECHAMPION, oEnemy);
        nBlack = GetLevelByClass(CLASS_TYPE_BLACKGUARD, oEnemy);

        nTotal = nMaster + nFighter + nDefender + nBarb + nRanger + nPaladin + nChampion + nBlack;
        if(nTotal >= 18 || nMaster >= 7)
            return oEnemy;
        i++;
        oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    }
    return OBJECT_INVALID;
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

    object oTempIntruder = GetEnemy();
    if(oTempIntruder != OBJECT_INVALID)
        oIntruder = oTempIntruder;



    /*
    - First - enter rage
    - If wounded - then use talent heal on self (potions)
    - 20% of using called shot
    - 20% of using knockdown
    - 20% of using power attack
    - 20% of using improved power attack
    - 20% of normal attack
    */

    if(GetLocalInt(OBJECT_SELF, "USED_RAGE") == 0)
    {
        //ClearAllActions();
        PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
        //ActionUseFeat(FEAT_BARBARIAN_RAGE, OBJECT_SELF);
        ActionCastSpellAtObject(SPELLABILITY_BARBARIAN_RAGE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
        effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "USED_RAGE", 1);
        __TurnCombatRoundOn(FALSE);
        //if(IsDifficult())
        //    ActionUseFeat(FEAT_KNOCKDOWN, oIntruder);
        DetermineCombatRound(oIntruder);
        return;
    }

    DoVoiceChat();

    float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
    if(fHP < 0.3)
    {
        if(TalentHealingSelf())
        {
            __TurnCombatRoundOn(FALSE);
            return;
        }
    }

    int nRand = Random(100) + 1;

    if(oTempIntruder != OBJECT_INVALID) // special case against fighters
    {
        if(GetLocalInt(OBJECT_SELF, "INIT_KNOCKDOWN") == 0 && IsDifficult())
        {
            SetLocalInt(OBJECT_SELF, "INIT_KNOCKDOWN", 1);
            ActionUseFeat(FEAT_KNOCKDOWN, oIntruder);
            __TurnCombatRoundOn(FALSE);
            return;
        }
        int nScale = GetLocalInt(OBJECT_SELF, "SCALE"); // used to decrease the chance of special anti-fighter AI
        nRand -= (60 - nScale);
        nScale += 10;
        if(nScale > 60)
            nScale = 60;
        SetLocalInt(OBJECT_SELF, "SCALE", nScale);

    }

    if(nRand <= 20) // called shot
    {
        ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
    }
    else if(nRand <= 40 && IsDifficult()) // knockdown
    {
        ActionUseFeat(FEAT_KNOCKDOWN, oIntruder);
    }
    else if(nRand <= 60) // power attack
    {
        //PlayVoiceChat(VOICE_CHAT_BATTLECRY2);
        ActionUseFeat(FEAT_POWER_ATTACK, oIntruder);
    }
    else if(nRand <= 80 && IsDifficult()) // Improved power attack
    {
        //PlayVoiceChat(VOICE_CHAT_BATTLECRY3);
        ActionUseFeat(FEAT_IMPROVED_POWER_ATTACK, oIntruder);
    }
    else // normal attack
    {
        ActionAttack(oIntruder);
    }


    __TurnCombatRoundOn(FALSE);

}
