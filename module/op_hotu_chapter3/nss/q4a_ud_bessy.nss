//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_bessy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script causes Bessy to search for the
     nearest boulder to attack.  She will keep
     attacking the surrounding ones, then rest for
     a drink.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 10, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
       object oBoulder1 = GetObjectByTag("q4a_boulder");
       object oBoulder2 = GetNearestObjectByTag("q4a_boulder2");

       location lLoc = GetLocation(GetWaypointByTag("q4a_bessy_wp"));

       if(oBoulder1 != OBJECT_INVALID)
          ActionAttack(oBoulder1);
       else if(oBoulder2 != OBJECT_INVALID)
          ActionAttack(oBoulder2);
       else {
          if(GetDistanceToObject(GetWaypointByTag("q4a_bessy_wp")) > 2.0)
             ActionMoveToLocation(lLoc, FALSE);
          else
             SetFacing(GetFacing(GetWaypointByTag("q4a_bessy_wp")));
       }
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

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

