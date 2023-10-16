//::///////////////////////////////////////////////
//:: Witchwork 1: Mine Cinematic, Script #2
//:: WW1_MineCine_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Concludes Mine Cinematic
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2002
//:://////////////////////////////////////////////

void SendToMines(object oPC)
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oMineDestination = GetObjectByTag("DST_SteinfaarMines");

    //Flag them as having completed the Mine Cineatic.
    SetLocalInt(oPC, "CONV_MINE_End", TRUE);

    //Fade to Black
    FadeToBlack(oPC, FADE_SPEED_FAST);

    //Teleport the player and all associates into the Mines
    AssignCommand(oPC, ActionJumpToObject(oMineDestination));
    AssignCommand(oHenchman, ActionJumpToObject(oMineDestination));
    AssignCommand(oFamiliar, ActionJumpToObject(oMineDestination));
    AssignCommand(oAnimalCompanion, ActionJumpToObject(oMineDestination));
}

void main()
{
    object oPC = GetPCSpeaker();
//    object oJagerInvis2 = GetLocalObject(oPC, "oJagerInvis2");

    //Delay sending the player and associates to the Mines.
    DelayCommand(0.5, SendToMines(oPC));

    //End the cutscene
    DelayCommand(1.0, SetCutsceneMode(oPC, FALSE));

    //Restore the camera height.
    DelayCommand(1.0, SetCameraHeight(oPC, 0.0));

    //Remove their immortality.
    SetImmortal(oPC, FALSE);
    SetPlotFlag(oPC, FALSE);

    //Destroy Invisible Conversation Holder.
//    DestroyObject(oJagerInvis2, 15.0);
}
