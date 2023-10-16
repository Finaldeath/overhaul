#include "NW_I0_GENERIC"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Dungeon",20);
    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
    SetLocalObject(OBJECT_SELF,"NW_L_GorkanTarget",GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectInvisibility(INVISIBILITY_TYPE_NORMAL),OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack",1);
    DetermineCombatRound();
}
