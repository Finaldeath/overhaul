//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName  q1rural_ud_nath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set a variable if Nathan is killed by a PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1007) // DEATH
    {
        object oPC = GetLastHostileActor();
        if (GetIsPC(oPC) == TRUE)
            SetLocalInt(GetModule(),"X1_NATHANMURDERED", 10);
    }


}

