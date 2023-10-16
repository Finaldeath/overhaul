// * Morag project goes hostile and gets her allies to attack
#include "nw_i0_generic"
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if (GetIsObjectValid(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M4Q01TALK_PROJECTION",1);
        //ExecuteScript("NW_D2_ATTONEND", OBJECT_SELF);
        AdjustReputation(oPC, GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND), -100);
        AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND), DetermineCombatRound());
        AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,2), DetermineCombatRound());
        AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,3), DetermineCombatRound());
        AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,4), DetermineCombatRound());
        AssignCommand(GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_FRIEND,OBJECT_SELF,5), DetermineCombatRound());
        SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
        effect eVis = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
        DestroyObject(OBJECT_SELF, 1.0);
    }
}
