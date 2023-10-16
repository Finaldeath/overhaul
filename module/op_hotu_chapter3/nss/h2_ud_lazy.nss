//::///////////////////////////////////////////////
//:: Lazy the Imp, User-Defined Events
//:: H2_UD_Lazy.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle Lazy's sleeping and escaping.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        int bAwake = GetLocalInt(OBJECT_SELF, "bAwake");
        if (bAwake == FALSE)
        {
            effect eSleep = EffectSleep();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, OBJECT_SELF, 7.0);
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


