//::///////////////////////////////////////////////
//:: aoe_hosfear
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    BRUTAL BRUTAL BRUTAL Hammer fix for the
    cutscene conversations with objects in
    Kingmaker. This will scare the crap out
    of anything that gets close to the PC
    while the PC is in dialog with the Sword.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

void main ()
{
    object oPC = GetFirstPC();
    effect eFear = EffectFrightened();

    // Cycle through everything and "Fear" the hostile ones
    object oCursor = GetFirstObjectInShape(SHAPE_SPHERE, 20.0f, GetLocation(oPC));

    while (GetIsObjectValid(oCursor) == TRUE)
    {
        if ((GetIsReactionTypeHostile(oPC, oCursor))
          && (GetObjectType(oCursor) == OBJECT_TYPE_CREATURE))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFear, oCursor, 30.0f);
        }

        oCursor = GetNextObjectInShape(SHAPE_SPHERE, 20.0f, GetLocation(oPC));
    }
}
