#include "NW_I0_Plot"
void main()
{
    SetLocalInt(OBJECT_SELF,"NW_G_M1Q5D01WardDown",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1Q5DPassStone"));
    RewardXP("M1Q5_Begg_3b",100,GetPCSpeaker());
}
