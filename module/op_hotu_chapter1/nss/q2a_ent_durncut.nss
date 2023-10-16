//::///////////////////////////////////////////////
//:: Name: q2a_ent_durncut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the main Hero PC enters this trigger,
    Cutscene mode will be entered - Durnan will initiate
    dialog - his main speech.  Everyone in the room
    will stand and face Durnan during his speech...
    At the end of his speech - the attack cut-scene will play
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 7/03
//:://////////////////////////////////////////////

void BringNPCs(object oPC);
void RemoveFamiliar(object oPC);

void main()
{
    object oPC = GetEnteringObject();
    if (GetLocalInt(oPC, "nPCNumber") == 1 && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        AddJournalQuestEntry("awakenings",99,oPC);
        BlackScreen(oPC);
        RemoveFamiliar(oPC);
        BringNPCs(oPC);
        FadeFromBlack(oPC);
    }
}




void BringNPCs(object oPC)
{
    // Cutscene actors and objects.
    object oDurnan = GetObjectByTag("q2adurnan");
    object oDialog = GetObjectByTag("q2adialog_durn");

    object oWhite = GetObjectByTag("White");
    object oGlim = GetObjectByTag("cut1_glim");
    object oLaf = GetObjectByTag("cut1_lafontaine");
    object oParley = GetObjectByTag("cut1_parley");
    //object oSabine = GetObjectByTag("cut1_sabine");
    //object oTanarell = GetObjectByTag("cut1_tan");
    //**HACK**// - destroy the hench types in the other room since they sometimes refuse to jump
    object oGrabber = GetObjectByTag("q2ahenchdestroyer");
    object oTomi = GetNearestObjectByTag("pre_tomi", oGrabber);
    object oDaelan = GetNearestObjectByTag("pre_daelan", oGrabber);
    object oLinu = GetNearestObjectByTag("pre_linu", oGrabber);
    object oSharwyn = GetNearestObjectByTag("pre_sharwyn", oGrabber);
    DestroyObject(oTomi);
    DestroyObject(oDaelan);
    DestroyObject(oLinu);
    DestroyObject(oSharwyn);

    // Cutscene waypoint locations
    object oPC1 = GetWaypointByTag("wp_cutatk_pc1");

    object oLaf1 = GetWaypointByTag("wp_cutatk_laf1");

    object oWhite1 = GetWaypointByTag("wp_cutatk_white1");
    object oTan1 = GetWaypointByTag("wp_cutatk_tan1");
    object oSabine1 = GetWaypointByTag("wp_cutatk_sabine1");
    object oGlim1 = GetWaypointByTag("wp_cutatk_glim1");
    //location l4Adv1 = GetLocation(GetWaypointByTag("wp_cutatk_4adv"));
    //object oDaelan1 = GetWaypointByTag("wp_cutatk_daelan");
    //object oLinu1 = GetWaypointByTag("wp_cutatk_linu");
    //object oSharwyn1 = GetWaypointByTag("wp_cutatk_sharwyn");
    //object oTomi1 = GetWaypointByTag("wp_cutatk_tomi");

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////
    AssignCommand(oPC, JumpToObject(oPC1));
    /*
    SetCommandable(TRUE, oSharwyn);
    AssignCommand(oSharwyn, JumpToObject(oSharwyn1));
    AssignCommand(oSharwyn, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    SetCommandable(TRUE, oDaelan);
    AssignCommand(oDaelan, JumpToObject(oDaelan1));
    AssignCommand(oDaelan, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    SetCommandable(TRUE, oTomi);
    AssignCommand(oTomi, JumpToObject(oTomi1));
    AssignCommand(oTomi, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    SetCommandable(TRUE, oLinu);
    AssignCommand(oLinu, JumpToObject(oLinu1));
    AssignCommand(oLinu, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));
    */
    AssignCommand(oWhite, JumpToObject(oWhite1));
    AssignCommand(oWhite, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    AssignCommand(oGlim, JumpToObject(oGlim1));
    AssignCommand(oGlim, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    AssignCommand(oLaf, JumpToObject(oSabine1));
    AssignCommand(oLaf, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));

    AssignCommand(oParley, JumpToObject(oTan1));
    AssignCommand(oParley, ActionDoCommand(SetFacingPoint(GetPosition(oDurnan))));



    // Dialogue

    DelayCommand(2.0, AssignCommand(oDurnan, ActionStartConversation(oPC)));

    // Animations
    /////////////

    // Listening animations

    AssignCommand(oGlim, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 2.0));
    AssignCommand(oLaf, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 2.0));

    AssignCommand(oGlim, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 4.0));

    AssignCommand(oWhite, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 4.0));


}

void RemoveFamiliar(object oPC)
{
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    if (GetIsPossessedFamiliar(oFamiliar) == TRUE)
    {
        UnpossessFamiliar(oFamiliar);
    }
    if (GetIsObjectValid(oFamiliar) == TRUE)
        DestroyObject(oFamiliar);
}



