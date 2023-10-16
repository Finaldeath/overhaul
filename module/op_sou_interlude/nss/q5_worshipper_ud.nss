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
    if(nEvent == EVENT_ATTACKED)
    {
        object oSound = GetNearestObjectByTag("ChantsMenOutside");
        if(oSound != OBJECT_INVALID)
            SoundObjectStop(oSound);
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
