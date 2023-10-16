//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        int nRand = Random(3);
        int nAnim;
        if(nRand == 0)
            ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED);
        else if(nRand == 1)
            ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
        else
            ActionPlayAnimation(ANIMATION_LOOPING_LOOK_FAR, 1.0, 3.0);

    }
    else if(nEvent == 1007) // death
    {
        SetLocalInt(GetModule(),"q5a_Aoists_Murdered", 1);
        int nAlign = GetAlignmentGoodEvil(GetLastKiller());
        if(nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL)
        {
            object oKiller = GetLastKiller();
            AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
        }
    }
    return;

}
