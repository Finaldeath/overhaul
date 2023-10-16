//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_catreset
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will reset the catapult.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 3, 2003
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
        object oCatapult = GetNearestObjectByTag("Catapult");
        effect eEffect = GetFirstEffect(oCatapult);

        SetLocalInt(oCatapult, "HX_CATAPULT_BEEN_FIRED", 0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_X), oCatapult);

        while(GetIsEffectValid(eEffect))
        {
            if(GetEffectCreator(eEffect) == oCatapult)
            {
                RemoveEffect(oCatapult, eEffect);
            }
            eEffect = GetNextEffect(oCatapult);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

