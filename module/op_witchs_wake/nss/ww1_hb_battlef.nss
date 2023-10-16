//::///////////////////////////////////////////////
//:: Witch's Wake 1: Battlefield OnEnter
//:: WW1_HB_Battlef.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the scenario of players dying in this
     area (their plot flags need to be turned off
     b/c they won't be refiring the OnEnter).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 23, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oArea;
    object oHenchman;
    object oFamiliar;
    object oAnimalCompanion;

    while (oPC != OBJECT_INVALID)
    {
        oArea = GetArea(oPC);
        if (oArea == OBJECT_SELF)
        {
            //Make sure they and and their associates are no longer flagged as
            //invulnerable after death.
            oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
            oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
            oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

            SetPlotFlag(oPC, FALSE);
            SetPlotFlag(oHenchman, FALSE);
            SetPlotFlag(oFamiliar, FALSE);
            SetPlotFlag(oAnimalCompanion, FALSE);

        }
        oPC = GetNextPC();
    }
}
