//::///////////////////////////////////////////////
//:: Yuan-Ti Evoker Custom User Defined Event
//:: 2Q4E_YUAN01_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 12, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {
        if(!GetIsObjectValid(GetObjectByTag("2Q4_GrvLght01")))
        {
            SetPlotFlag(OBJECT_SELF, FALSE);
        }
        else
        {
            ClearAllActions();
        }
    }
}

