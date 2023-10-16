// * Guzud flees but gives player some xp
#include "nw_i0_plot"
#include "nw_i0_generic"

void main()
{
        RewardXP("M3Q1_A07_BANDIT_PLOT",25, GetPCSpeaker());
        object oDoor = GetNearestObjectByTag("M3Q2B_GUZUDDOOR");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
//        SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);
        EscapeArea();
}
