// Valana leaves without being convinced one way or the other
// PC gets half the experience

#include "NW_I0_PLOT"

void main()
{
    RewardXP("xphigh", 50, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q5b_Talked_Healer", 2);

    object oDoor = GetObjectByTag("Q5B_Temple_AoEncampment");
    ClearAllActions();
    ActionMoveToObject(oDoor);
    DestroyObject(OBJECT_SELF, 4.0);
    SetCommandable(FALSE);
}
