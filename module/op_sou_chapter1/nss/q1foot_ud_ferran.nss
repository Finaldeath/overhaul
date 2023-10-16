//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName  q1foot_ud_ferran
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Ferrans User Defined script.
      Flee the area if he kills a pc and takes the
      shadow hart's horns
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 1/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //flee the area if he has grabbed the horns from a dead pc
        if (GetLocalInt(OBJECT_SELF, "nFleeArea") == 1)
        {
            if (GetIsInCombat() == FALSE)
            {
                ActionRandomWalk();
                DestroyObject(OBJECT_SELF, 4.0);

            }
        }
    }


}

