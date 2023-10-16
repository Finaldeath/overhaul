//::///////////////////////////////////////////////
//:: Name act_q2dcdigger_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transport PC and associates to the other side
    of the formian secret door on level 3 of Undermountain
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 27/03
//:://////////////////////////////////////////////
void SendCreature(object oCreature, location lDest);

void main()
{
    object oPC = GetPCSpeaker();
    location lTarget = GetLocation(GetWaypointByTag("wp_q2dc_diggerexit"));
    location lSpawnPoint = GetLocation(GetWaypointByTag("wp_q2dc_formiandigger"));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", lTarget);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", GetLocation(oPC));
    FadeToBlack(oPC);
    SendCreature(oPC, lTarget);
    DelayCommand(1.5, FadeFromBlack(oPC));
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oHenchman2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

    DelayCommand(0.5, SendCreature(oAnimal, lTarget));
    DelayCommand(0.5, SendCreature(oDominated, lTarget));
    DelayCommand(0.5, SendCreature(oFamiliar, lTarget));
    DelayCommand(0.5, SendCreature(oHenchman, lTarget));
    DelayCommand(0.5, SendCreature(oHenchman2, lTarget));
    DelayCommand(0.5, SendCreature(oSummoned, lTarget));
}

void SendCreature(object oCreature, location lDest)
{
    if(oCreature != OBJECT_INVALID)
    {
        effect eRocks = EffectVisualEffect(137);//rocks up effect
        location lStart = GetLocation(oCreature);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, lStart);
        AssignCommand(oCreature, ClearAllActions());

        DelayCommand(1.0, AssignCommand(oCreature, ActionJumpToLocation(lDest)));

        DelayCommand(1.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, GetLocation(oCreature)));
    }
}


