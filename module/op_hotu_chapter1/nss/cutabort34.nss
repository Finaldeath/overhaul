//::///////////////////////////////////////////////
//:: Name cutabort34
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of the Halaster freedom cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void ClearAOE(object oCreature);
void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oCreature = GetFirstObjectInArea(GetArea(oPC));
    int bIsDrow;
    while(oCreature != OBJECT_INVALID)
    {
        bIsDrow = GetLocalInt(oCreature, "IS_DROW");
        if(bIsDrow)
            DestroyObject(oCreature, 1.0);
        oCreature = GetNextObjectInArea(GetArea(oPC));
    }
    //clear the area effects around halaster
    object oHalaster = GetObjectByTag("q2d_halaster");
    ClearAOE(oHalaster);
    AssignCommand(oHalaster, ClearAllActions());
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    //have halaster talk to the PC
    //DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    //DelayCommand(1.5, ActionStartConversation(oPC));
}

//Clear  a sphere around a creature of all area of effect spells
void ClearAOE(object oCreature)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oCreature);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE |OBJECT_TYPE_AREA_OF_EFFECT);
    }
}
