//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_duermage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Duergar Mage user defined script
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
        object oGord = GetObjectByTag("q2_thegord");
//        int nJob = GetLocalInt(GetModule(), "OS_THEGORD_DWARF");
  //      if(nJob == 20)
//        {
        object oSpell = GetObjectByTag("q3_duerspell");
        SetLocalInt(oSpell,"OS_DUERGAR_SPELL",20);
        SetLocalInt(GetModule(), "OS_THEGORD_DWARF",30);
//        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

