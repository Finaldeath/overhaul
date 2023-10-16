//::///////////////////////////////////////////////
//:: Name q2d4_use_walllev
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Using this lever will destroy the nearest wall of swords
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 25/03
//:://////////////////////////////////////////////

void ClearAOE(object oObject);

void main()
{
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    ClearAOE(OBJECT_SELF);

}

//Clear  a sphere around a creature of all area of effect spells
void ClearAOE(object oObject)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oObject);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
}
