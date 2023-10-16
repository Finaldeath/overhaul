//::///////////////////////////////////////////////
//:: M2Q4C_ERB_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Had to move this from the OnSpawnIn script
  to the heartbeat script.

  Keep on checking until Lady jadale's object is valid.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_j_fetch"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_SETMYSELFUP") == 1)
        {
            return;
        }
            SetGlobal(OBJECT_SELF,OBJECT_SELF);
            SetFetchItem("2Q4_ErbsRing"); //Set the item tag for plot item to be retrieved
            SetPlotTag("m2q4_Erb"); //Journal Entry Tag.

        object oJadale = GetObjectByTag("2Q4A_Jadale");      // 2Q4A_Jadale
        if (GetIsObjectValid(oJadale) == TRUE)
        {

            SetFetchee(oJadale);
            SetGlobal(GetFetchee(), OBJECT_SELF);  //Leave this alone, shows where the globals are.
            SetLocalInt(OBJECT_SELF,"NW_L_SETMYSELFUP",1);
        }
    }

}
