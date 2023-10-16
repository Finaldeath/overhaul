//::///////////////////////////////////////////////
//:: Name q6_ud_deadman
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Mr. Blake will appear to be dead until
        spoken to...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1001)
    {
        /*
        //First HB - knock Blake down
        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(4), OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), OBJECT_SELF);
            SetCommandable(FALSE);
            CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(OBJECT_SELF));
        }
        */
    }

}

