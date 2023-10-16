// * YVette checks in her heartbeat to try and setup plot
// * Has to wait until Galrone is created
#include "nw_j_fetch"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        // * if already setup then exit
        if (GetLocalInt(OBJECT_SELF,"NW_L_SETMYSELFUP") == 1)
            return;
        object oGalrone = GetObjectByTag("2Q4A_Galrone");      // 2Q4A_Jadale
        SetGlobal(OBJECT_SELF,OBJECT_SELF);
        SetFetchItem("2Q4_YvettesBaby"); //Set the item tag for plot item to be retrieved
        SetPlotTag("m2q4_Yvette"); //Journal Entry Tag.


        if (GetIsObjectValid(oGalrone) == TRUE)
        {

            SetFetchee(oGalrone);
            SetGlobal(GetFetchee(), OBJECT_SELF);  //Leave this alone, shows where the globals are.

            SetLocalInt(OBJECT_SELF,"NW_L_SETMYSELFUP",1);
        }
    }
}

