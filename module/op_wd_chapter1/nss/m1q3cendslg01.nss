#include "NW_I0_Plot"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_HeadReturned",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1Q3ILoxarHead"));
    RewardXP("m1q3i_Loxar",100,GetPCSpeaker());
    AutoAlignG(DC_EASY,GetPCSpeaker());
}
