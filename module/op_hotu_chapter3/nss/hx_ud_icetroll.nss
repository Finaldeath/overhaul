//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_icetroll
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Reapplies ice effect on death.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:  Oct 24, 2003
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
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(465), OBJECT_SELF);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

