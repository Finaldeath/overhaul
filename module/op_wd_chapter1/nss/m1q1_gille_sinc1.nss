#include "NW_I0_Plot"
void main()
{
    if (GetLocalInt(GetModule(),"nw_g_m1q1_Giles") < 10)
    {
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 10);
    }
}
