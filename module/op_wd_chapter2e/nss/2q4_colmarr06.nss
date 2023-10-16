#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetPCSpeaker(),"Colmarr_Told_Invention",2);
    SetLocalInt(GetModule(),"Contrapulator_Fixed",2);

    RewardXP("m2q4_Colmarr",100,GetPCSpeaker());
}
