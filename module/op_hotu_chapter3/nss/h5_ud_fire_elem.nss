//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName h5_ud_fire_elem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the fire elems teleport to
     their attacker if they are too far away.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 14, 2003
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
        object oAttacker = GetLastDamager();
        location lSelf = GetLocation(OBJECT_SELF);
        location lAttacker = GetLocation(oAttacker);

        if(GetDistanceToObject(oAttacker) > 5.0)
        {
            ClearAllActions();
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), lSelf);
            DelayCommand(0.7, ActionJumpToLocation(lAttacker));
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

