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
        if(GetLocalInt(OBJECT_SELF, "SLEEP") == 1)
        {
            effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, OBJECT_SELF);
        }
    }
    return;

}
