#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetModule(),"NW_FORMOSA_JOB",1);
    SetLocalInt(GetPCSpeaker(),"NW_FORMOSA_JOB_ACCEPTED",2);
    SetLocalInt(OBJECT_SELF,"FORMOSA_ADVANCE",1);
    RewardGP(100,GetPCSpeaker(),FALSE);
}
