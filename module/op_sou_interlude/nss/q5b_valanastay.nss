// Valana has been convinced to stay
// PC gets experience

#include "NW_I0_PLOT"

void main()
{
    RewardXP("xphigh", 100, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q5b_Talked_Healer", 3);
}
