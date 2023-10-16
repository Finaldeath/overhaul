//* Bloodsailer will leave area being persuaded by the PC
#include "NW_I0_Plot"
void main()
{
    SetLocalInt(OBJECT_SELF, "NW_L_Leaving", 1);
    ActionForceMoveToObject(GetNearestObjectByTag("m1q2E_m1q2D"),TRUE,2.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
    if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
    {
        RewardXP("m1q2_PrisonBreak",16,GetPCSpeaker());
        SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
        AdjustAlignment(GetPCSpeaker(),ALIGNMENT_GOOD,1);
    }
}
