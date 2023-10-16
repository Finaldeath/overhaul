//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName x1_ud_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On first heartbeat - this creature will die,
    but their body will remain
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 25/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            SetIsDestroyable(FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(500), OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
        }
    }


}


