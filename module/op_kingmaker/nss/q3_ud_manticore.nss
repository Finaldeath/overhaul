//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_manticore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Manticore User Defined Events script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        object oLevioSa = GetObjectByTag("q2_leviosa");
        object oPC = GetFirstPC();
        if(GetLocalInt(GetModule(), "os_manticorehunt")==15)
        //if trap recreated
        {
            SetLocalInt(GetModule(), "os_manticorehunt",30);
            GiveXPToCreature(oPC,500);
        }
        else// manticore killed without trap
        {
            SetLocalInt(GetModule(), "os_manticorehunt",20);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

