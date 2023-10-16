//This hacky trigger just sets it so the Henchmenw
//on't say any of their random lines from Chapter 2
#include "x2_inc_banter"

void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsPC(oEnter) == TRUE)
        return;
    // * only NPCs matter
    int nAlready = GetLocalInt(oEnter, "X2_L_CLEARED");
    if (nAlready == 0)
    {
        GetRandomTextNumber(oEnter, "X2_L_RANDOMONELINERS", 1);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOMONELINERS", 2);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOMONELINERS", 3);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOMONELINERS", 4);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOMONELINERS", 5);
        // * interjections
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOM_INTERJECTIONS", 1);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOM_INTERJECTIONS", 2);
 //       GetRandomTextNumber(oEnter, "X2_L_RANDOM_INTERJECTIONS", 3);
        SetLocalInt(oEnter, "X2_L_CLEARED", 1);
    }
}
