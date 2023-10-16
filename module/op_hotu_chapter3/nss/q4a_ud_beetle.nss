//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_beetle
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when the beetle dies,
     causing fire damage to those near it.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 10, 2003
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
       object oObject = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF),
                                              TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);

       // The damage amount.
       int iDmg = Random(20) + 5;

       // Show an explosion on the beetle.
       ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL),
                           OBJECT_SELF);

       // Apply damage and effects to those caught in the blast.
       while(oObject != OBJECT_INVALID) {
          ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oObject);
          ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDmg, DAMAGE_TYPE_FIRE), oObject);
          oObject = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF),
                                          TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
       }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

