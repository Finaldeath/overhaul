//::///////////////////////////////////////////////
//:: Name hx_party_jumper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is a failsafe for certain areas that
     will jump associates to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 30, 2003
//:://////////////////////////////////////////////
// Jump PC and associates.
void AllJumpToLocation(object oObject);

void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        AllJumpToLocation(oPC);
    }
}

// Jump PC and associates.
void AllJumpToLocation(object oObject)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    location lLoc = GetLocation(oObject);

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions());
        AssignCommand(oHench1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions());
        AssignCommand(oHench2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions());
        AssignCommand(oHench3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions());
        AssignCommand(oAssoc1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions());
        AssignCommand(oAssoc2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions());
        AssignCommand(oAssoc3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions());
        AssignCommand(oAssoc4, ActionJumpToLocation(lLoc));
    }
}
