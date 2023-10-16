//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2d_ud_formqueen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
            return;

        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE), OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR), OBJECT_SELF);

        SetCommandable(FALSE);
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

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

