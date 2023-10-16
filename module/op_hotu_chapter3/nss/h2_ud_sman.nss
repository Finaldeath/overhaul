//::///////////////////////////////////////////////
//:: Sleeping Man, User-Defined Events
//:: H2_UD_SMan.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Sleeping Man's sleep.
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
            effect eSleep = ExtraordinaryEffect(EffectSleep());
            SetPlotFlag(OBJECT_SELF, FALSE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, OBJECT_SELF, 7.0);
            SetPlotFlag(OBJECT_SELF, TRUE);
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
        SetLocalInt(GetModule(),"bSleepingManPlotDead", TRUE);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
}
