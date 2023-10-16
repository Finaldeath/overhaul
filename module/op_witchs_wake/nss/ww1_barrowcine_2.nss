//::///////////////////////////////////////////////
//:: Witchwork 1: Barrow Site Cinematic, Script #2
//:: WW1_BarrowCine_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Concludes Barrow Site Cinematic
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2002
//:://////////////////////////////////////////////

void JumpToMineEntrance(object oPC)
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oMineEntrance = GetNearestObjectByTag("WP_Mine");

    //Blackout.
    BlackScreen(oPC);

    //Clear actions
    AssignCommand(oPC, ClearAllActions(TRUE));

    //Teleport the player and all associates to the Mine Entrance.
    AssignCommand(oPC, JumpToObject(oMineEntrance));
    AssignCommand(oHenchman, JumpToObject(oMineEntrance));
    AssignCommand(oFamiliar, JumpToObject(oMineEntrance));
    AssignCommand(oAnimalCompanion, JumpToObject(oMineEntrance));
}

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    //object oSteinfaar = GetLocalObject(oPC, "oSteinfaar");
    //object oBlauhart = GetLocalObject(oPC, "oBlauhart");
    //object oGreinlager = GetLocalObject(oPC, "oGreinlager");
    object oPool = GetLocalObject(oPC, "oPool");
    object oArmsman1 = GetObjectByTag("CineArmsman1");
    object oArmsman2 = GetObjectByTag("CineArmsman2");
    object oWP_Armsman1 = GetObjectByTag("WP_Armsman1");
    object oWP_Armsman2 = GetObjectByTag("WP_Armsman2");
    float fWP_Armsman1 = GetFacing(oWP_Armsman1);
    float fWP_Armsman2 = GetFacing(oWP_Armsman2);

    //Flag player as having completed the conversation.
    SetLocalInt(oPC, "CONV_BARROW_End", TRUE);

    //Combat's screwing up their jump commands so ensure they're immortal.
    SetPlotFlag(oPC, TRUE);

    //Move Armsmen to player.
    AssignCommand(oArmsman1, ActionMoveToObject(oPC, TRUE, 2.0));
    AssignCommand(oArmsman2, ActionMoveToObject(oPC, TRUE, 2.0));

    //Have Armsmen knock him down.
    AssignCommand(oArmsman1, ActionUseFeat(FEAT_IMPROVED_KNOCKDOWN, oPC));
    AssignCommand(oArmsman2, ActionUseFeat(FEAT_IMPROVED_KNOCKDOWN, oPC));

    //Teleport player & Associates to Mine Entrance.
    DelayCommand(5.0, JumpToMineEntrance(oPC));

    //Return Armsmen to their post.
    AssignCommand(oArmsman1, ActionMoveToObject(oWP_Armsman1, TRUE, 0.1));
    AssignCommand(oArmsman2, ActionMoveToObject(oWP_Armsman2, TRUE, 0.1));
    AssignCommand(oArmsman1, DelayCommand(10.0, SetFacing(fWP_Armsman1)));
    AssignCommand(oArmsman2, DelayCommand(10.0, SetFacing(fWP_Armsman2)));

    //Make the Armsmen no longer hostile to the player
    DelayCommand(6.0, SetIsTemporaryNeutral(oPC, oArmsman1));
    DelayCommand(6.0, SetIsTemporaryNeutral(oPC, oArmsman2));

    //Destroy Invisible Conversation Holders.
    //DestroyObject(oSteinfaar, 15.0);
    //DestroyObject(oBlauhart, 15.0);
    //DestroyObject(oGreinlager, 15.0);
    DestroyObject(oPool, 15.0);
}
