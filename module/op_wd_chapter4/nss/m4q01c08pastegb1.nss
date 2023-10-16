//////////Reward XP, return all PC equipment and give PC key MTkKySource24Q1

#include "nw_i0_plot"

void main()
{
    RewardXP("NW_PAST_LIFE",100,GetPCSpeaker());
    ///////return all PC equipment, move them back to area 4Q1C08
    CreateItemOnObject( "M4Q1C07KEY3", GetPCSpeaker());
   // M4Q1C07KEY3
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    object oDest = GetObjectByTag("M4C08_OUTSIDE");
    if (GetIsObjectValid(oDest) == TRUE)
        AssignCommand(GetPCSpeaker(),JumpToObject(oDest, FALSE));
    else
        SpeakString("UT : ERROR");
}
