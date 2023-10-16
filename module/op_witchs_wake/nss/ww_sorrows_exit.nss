//::///////////////////////////////////////////////
//:: Witchwork: Plane of Sorrows OnExit
//:: WW_Sorrows_Exit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Makes the PC and all her associates no
     longer invulnerable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();

    if (GetIsPC(oExiter) == TRUE)
    {
        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oExiter);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oExiter);
        object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oExiter);

        SetPlotFlag(oExiter, FALSE);
        SetPlotFlag(oHenchman, FALSE);
        SetPlotFlag(oFamiliar, FALSE);
        SetPlotFlag(oAnimalCompanion, FALSE);

        //Designate the player as no longer being in the Filcher Maze (in case
        //the DM removed them.
        SetLocalInt(oExiter, "bPCInFilchMaze", FALSE);
    }
}
