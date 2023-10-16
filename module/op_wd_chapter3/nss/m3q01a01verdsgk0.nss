#include "MQ3TRIAL"

void main()

////// This script will check the status of the jury and set the Global of the verdict (NW_G_M3Q01PLOTVERDICT) to 0,1,2, 3, 4 or 5
/////  It will also set TrialStatus to 2 (Trial Over)


{

//    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS",2);
    SetLocalInt(GetModule(), "NW_G_M3Q01PLOTVERDICT", CountInnocent());

}
