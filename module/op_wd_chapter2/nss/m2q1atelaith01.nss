#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"Already_Threatened",1);
    RewardGP(100,GetPCSpeaker(),FALSE);
}
