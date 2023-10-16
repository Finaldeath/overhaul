//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_mawg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create a lootable invis object to
     represent the dead goblin boss who was poly-
     morphed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 15, 2003
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
       location lLoc = GetLocation(OBJECT_SELF);

       CreateObject(OBJECT_TYPE_PLACEABLE, "q4a_mawg_invis", lLoc);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
