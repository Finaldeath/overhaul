// Custom AI script to get out of trap for NPCs

#include "nw_i0_generic"


void main()
{
    object oBlock = GetLocalObject(OBJECT_SELF, "Q6F_BLOCKER");
    int nMaxBlock = GetLocalInt(OBJECT_SELF, "X2_MAX_BLOCK_AI");
    if(nMaxBlock > 10)
        return;
    nMaxBlock++;
    SetLocalInt(OBJECT_SELF, "X2_MAX_BLOCK_AI", nMaxBlock);
    if(oBlock != OBJECT_INVALID)
    {
        bkEquipMelee();
        if(GetHasFeat(FEAT_POWER_ATTACK))
            ActionUseFeat(FEAT_POWER_ATTACK, oBlock);
        else
            ActionAttack(oBlock);
        SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", TRUE);
        ActionDoCommand(DetermineCombatRound());
        return;
    }
    object oWP = GetNearestObjectByTag("q6f_wp_trap_exit");
    ActionMoveToObject(oWP, TRUE, 0.0);
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", TRUE);
    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "");
    DetermineCombatRound();

}
