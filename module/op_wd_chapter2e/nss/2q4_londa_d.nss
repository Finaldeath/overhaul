//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1006 || nUser == 1005) // DAMAGED
    {
        object oDamager = GetLastHostileActor();
        if(GetIsObjectValid(oDamager) && !GetIsPC(oDamager))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
        }
    }
}

