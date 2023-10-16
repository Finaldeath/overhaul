#include "nw_i0_plot"

void main()
{
    AssignCommand(GetObjectByTag("M2Q3DWANEVBRIDGE"),SetLocked(OBJECT_SELF,FALSE));
    AssignCommand(GetObjectByTag("M2Q3DWANEVBRIDGE"),ActionOpenDoor(OBJECT_SELF));
    SetLocalInt(GetPCSpeaker(),"NW_L_EntranceGrantedLerk",1);
    RewardXP("m2q1_Wanev",33, GetPCSpeaker());
}
