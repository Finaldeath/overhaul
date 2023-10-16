//::///////////////////////////////////////////////
//:: FileName q3c_at_attck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/27/2003 1:14:30 PM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{

    // Set the faction to hate the player, then attack the player
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -50);
    AdjustReputation(OBJECT_SELF, GetPCSpeaker(), -50);
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound(GetPCSpeaker());
}
