#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD", 1);
    }
}
