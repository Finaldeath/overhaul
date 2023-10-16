//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_gruul
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will destroy Gruul's desk in the event
     he gets attacked.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 29, 2003
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
        object oMap1 = GetNearestObjectByTag("Map", OBJECT_SELF, 1);
        object oMap2 = GetNearestObjectByTag("Map", OBJECT_SELF, 2);
        object oDesk = GetNearestObjectByTag("x0_wizdesk");

        if(GetIsObjectValid(oMap1))
        {
            SetPlotFlag(oMap1, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oMap1);
        }
        if(GetIsObjectValid(oMap2))
        {
            SetPlotFlag(oMap2, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oMap2);
        }
        if(GetIsObjectValid(oDesk))
        {
            SetPlotFlag(oDesk, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oDesk);
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

