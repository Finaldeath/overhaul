//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName  q1foot_ud_bear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Knock down bear on its first heartbeat.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 25/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            int nDamage = GetCurrentHitPoints() - 5;
            effect eDamage = EffectDamage(nDamage);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), OBJECT_SELF);
        }
    }


}


