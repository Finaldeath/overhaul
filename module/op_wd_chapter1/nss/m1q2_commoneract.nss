#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    vector vPC = GetPosition(oPC);

    SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION, FALSE);
    SetFacingPoint(vPC);
}
